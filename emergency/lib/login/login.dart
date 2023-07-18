import 'dart:io';
import 'package:emergency/registeration/regiteration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emergency/nurse/nurse.dart';
import 'package:emergency/pharmcy/pharmcy.dart';
import 'package:emergency/suppliesUnit/supplies.dart';
import 'package:flutter/material.dart';

import '../admin/admin.dart';
import '../room/roomState.dart';
// import 'package:intl/intl.dart' as intl;

// var mood = const ColorScheme.highContrastDark();
var dark = true;
var mycontroler = TextEditingController();
var str = "";
var texclr = Colors.purple;
var focsbordersClr = Color.fromARGB(255, 48, 135, 241);
var iconclr = Colors.purple;

// var icon = const Icon(Icons.visibility);
// var invisicon = const Icon(Icons.visibility_off);
// void main() => runApp(myApp());

// class myApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "text field",
//       theme: ThemeData(
//           primaryColor: Colors.pink,
//           colorScheme:
//           const ColorScheme.highContrastDark() /////////////////////
//         //accentColor: Colors.green, //////////////Old
//         // buttonTheme: ButtonThemeData(
//         //   buttonColor: Colors.red[900],
//         //   textTheme: ButtonTextTheme.accent,
//         // ), ///////////////////////////////////// Old
//       ),
//       home: myappstateful(),
//     );
//   }
// }

// selectScreen(BuildContext ctx, index) {
//   Navigator.of(ctx).pop();
//   switch (index) {
//     case 0:
//           () {};
//       break;
//     case 1:
//       Navigator.of(ctx)
//           .push(MaterialPageRoute(builder: (_) => supplies()));
//       break;
//     // case 2:
//     //   Navigator.of(ctx)
//     //       .push(MaterialPageRoute(builder: (_) => admin()));
//     //   break;
//     case 3:
//       Navigator.of(ctx)
//           .push(MaterialPageRoute(builder: (_) => addSheet()));
//       break;
//

//     case 4:
//       Navigator.of(ctx)
//           .push(MaterialPageRoute(builder: (_) => pharmcy()));
//       break;
//   }
// }

void selectScreen(BuildContext ctx, int n) {
  Navigator.of(ctx).push(MaterialPageRoute(
    builder: (_) {
      if (n == 1)
        return supplies();
      // else if(n==2) return admin();
      else if (n == 3) return addSheet();
      return pharmcy();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //     // primaryColor: Colors.pink,
      //     colorScheme: const ColorScheme.highContrastDark()
      //     // const ColorScheme.highContrastDark() /////////////////////
      //     //accentColor: Colors.green, //////////////Old
      //     // buttonTheme: ButtonThemeData(
      //     //   buttonColor: Colors.red[900],
      //     //   textTheme: ButtonTextTheme.accent,
      //     // ), ///////////////////////////////////// Old
      //     ),
      home: login(),
    );
  }
}

class login extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<login> {
  var Email = TextEditingController();
  var Password = TextEditingController();

  CollectionReference user = FirebaseFirestore.instance.collection('users');
  UserLogin(int n) {
    if (n == 1) {
      user.where('Id', isEqualTo: n).get().then((value) {
        value.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          print('========================================');
          print(element.data());
          print('========================================');

          if (Email.text == data['Email'] &&
              Password.text == data['Password']) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return supplies();
              },
            ));
          }
        });
      });
    }
    if (n == 2) {
      user.where('Id', isEqualTo: n).get().then((value) {
        value.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          print('========================================');
          print(element.data());
          print('========================================');
          if (Email.text == data['Email'] &&
              Password.text == data['Password']) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return addSheet();
              },
            ));
          }
        });
      });
    }
    if (n == 3) {
      user.where('Id', isEqualTo: n).get().then((value) {
        value.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          print('========================================');
          print(element.data());
          print('========================================');
          if (Email.text == data['Email'] &&
              Password.text == data['Password']) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return pharmcy();
              },
            ));
          }
        });
      });
    }
    if (n == 4) {
      user.where('Id', isEqualTo: n).get().then((value) {
        value.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          print('========================================');
          print(element.data());
          print('========================================');
          if (Email.text == data['Email'] &&
              Password.text == data['Password']) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return adminpage();
              },
            ));
          }
        });
      });
    }
    if (n == 5) {
      user.where('Id', isEqualTo: n).get().then((value) {
        value.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          print('========================================');
          print(element.data());
          print('========================================');
          if (Email.text == data['Email'] &&
              Password.text == data['Password']) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return roomPage();
              },
            ));
          }
        });
      });
    }
  }

  var passwordvisb = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("log in",
            style: TextStyle(color: Colors.black, fontSize: 30)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            gradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.deepPurpleAccent,
              Colors.blue
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            color:
                dark ? const Color.fromRGBO(48, 48, 48, 255) : Colors.grey[800],
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    // autocorrect: true,
                    decoration: InputDecoration(
                      // alignLabelWithHint: true,

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: focsbordersClr),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(20),
                        ),
                      ),

                      labelText: " Email",
                      // label: Text("Name"),
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "wrtie your email",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      hintTextDirection: TextDirection.ltr,
                      icon: Icon(
                        Icons.add_chart,
                        color: iconclr,
                      ),
                      helperText: "write your user name",
                      // fillColor: Colors.red,
                      // errorText: "error",
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    controller: Email,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    // autocorrect: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      // alignLabelWithHint: true,
                      labelText: " password",
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "enter your password",
                      hintStyle: const TextStyle(color: Colors.blueGrey),
                      helperText: "enter your password with keyboard",
                      icon: Icon(
                        Icons.password,
                        color: iconclr,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passwordvisb
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordvisb = !passwordvisb;
                          });
                        },
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.visiblePassword,
                    // keyboardAppearance: Brightness.dark,
                    obscureText: passwordvisb,
                    controller: Password,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    // const Text('I have  Not acount ?',
                    //     style: TextStyle(fontSize: 16)),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Text(
                      "If you do not have an account!\n       go to the admin to create an account for you",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 244,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    onPressed: () => {UserLogin(5)},
                    icon: const Icon(Icons.medication),
                    label: const Text(
                      "doctor",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 233,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    onPressed: () => {UserLogin(1)},
                    icon: const Icon(Icons.medical_services),
                    label: const Text(
                      "supply unit",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                // SizedBox(height: 5,),
                // ElevatedButton.icon(
                //   style: ButtonStyle(
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //       const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(40),
                //           topLeft: Radius.circular(40),
                //           topRight: Radius.circular(40),
                //           bottomRight: Radius.circular(40),
                //         ),
                //         side: BorderSide(color: Colors.black, width: 1),
                //       ),
                //     ),
                //     foregroundColor: MaterialStateProperty.all(Colors.black),
                //     backgroundColor: MaterialStateProperty.all(Colors.purple),
                //   ),
                //   onPressed: () => setState(() {
                //     var name = mycontroler.text;
                //     str = "the $name product send to data";
                //   }),
                //   icon: const Icon(Icons.medication),
                //   label: const Text("  as a admin  ",style: TextStyle(fontSize: 30),),

                // ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 222,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    onPressed: () => {UserLogin(2)},
                    icon: const Icon(Icons.person_pin),
                    label: const Text(
                      "Nurse ",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 205,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    onPressed: () => {UserLogin(3)},
                    icon: const Icon(Icons.medication),
                    label: const Text(
                      "pharmacy",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 193,
                  child: ElevatedButton.icon(
                    //amir part 2
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    onPressed: () => {UserLogin(4)},
                    icon: const Icon(Icons.medication),
                    label: const Text(
                      "admin",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () => exit(0),
                  icon: const Icon(Icons.healing),
                ),
                Text("$str"),
                const SizedBox(
                  height: 340,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            dark = !dark;
          });
        },
        child:
            dark ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
        highlightElevation: 45, //note this
        backgroundColor: Colors.purple,
      ),
    );
  }
}
