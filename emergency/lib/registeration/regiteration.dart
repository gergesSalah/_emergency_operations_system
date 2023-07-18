import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../admin/admin.dart';
import '../login/login.dart';

// var mood = const ColorScheme.highContrastDark();
var regdark = true;
// var mycontroler = TextEditingController();
// var str = "";

// var icon = const Icon(Icons.visibility);
// var invisicon = const Icon(Icons.visibility_off);

var texclr = Colors.purple;
var focsbordersClr = Color.fromARGB(255, 48, 135, 241);
var iconclr = Colors.purple;

final String secondColor = "purple";

// void selectScreen(BuildContext ctx, int n) {
//   Navigator.of(ctx).push(
//       MaterialPageRoute(
//         builder: (_) {
//           if (n == 1) return supplies();
//           else if(n==2) return admin();
//           else if(n==3) return addSheet();
//           return pharmcy();
//         },));
// }

class MyApp1 extends StatelessWidget {
  // const MyApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //     primaryColor: Colors.pink,
      //     colorScheme:
      //         const ColorScheme.highContrastDark() /////////////////////
      //     //accentColor: Colors.green, //////////////Old
      //     // buttonTheme: ButtonThemeData(
      //     //   buttonColor: Colors.red[900],
      //     //   textTheme: ButtonTextTheme.accent,
      //     // ), ///////////////////////////////////// Old
      //     ),
      home: register(),
    );
  }
}

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}
// class selectedDate{
//   DateTime ?Date = null;
//   bool flag = false;
//   selectedDate(this.Date,this.flag);
//   getdata(){
//     return Date;
//   }
//   getflag(){
//     return flag;
//   }
// }

class _registerState extends State<register> {
  // def() {
  //   print("object");
  // }
  DateTime? _selectedDate;
  bool Dateflag = false;

  // bool _DateFlag = false;
  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        if (value != null) {
          _selectedDate = value;
          Dateflag = true;
        }
      });
    });
  }

  var passwordvisb = true;
  TextEditingController name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Phone = TextEditingController();
  int? SingUpValue = 0;

  SingUPUser(int id) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    user.add({
      'Username': name.text,
      'Email': Email.text,
      'Password': Password.text,
      'Id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registration",
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
        leading: IconButton(
          icon: Icon(Icons.keyboard_return),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return adminpage();
            }));
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            color: regdark ? Color.fromRGBO(48, 48, 48, 255) : Colors.grey[800],
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    // autocorrect: true,
                    decoration: InputDecoration(
                      // alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 4,
                        ),
                        borderRadius: const BorderRadius.only(
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
                      labelText: " Name",
                      // label: Text("Name"),
                      labelStyle: TextStyle(color: texclr, fontSize: 26),
                      hintText: "wrtie the medicine's name",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      hintTextDirection: TextDirection.ltr,
                      icon: Icon(
                        Icons.add_chart,
                        color: iconclr,
                      ),
                      helperText: "write the medicine name",
                      // fillColor: Colors.red,
                      // errorText: "error",
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    controller: name,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    // autocorrect: true,
                    decoration: InputDecoration(
                      // alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
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
                      labelText: " email",
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "write your email",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.add_to_photos_sharp,
                        color: iconclr,
                      ),
                      helperText: "write a your email",
                      // prefix: Text("+02  "),
                    ),
                    keyboardType: TextInputType.text,
                    keyboardAppearance: Brightness.dark,
                    controller: Email,
                    //textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    // autocorrect: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
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
                      // alignLabelWithHint: true,
                      labelText: " password",
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "enter your password",
                      hintStyle: const TextStyle(color: Colors.blueGrey),
                      helperText: "help enter your password with keyboard",
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
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    // autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
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

                      // alignLabelWithHint: true,
                      labelText: " phone",
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "enter your phone",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.phone,
                        color: iconclr,
                      ),
                      helperText: "enter your phone",
                    ),
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.dark,
                    textAlign: TextAlign.center,
                    controller: Phone,
                  ),
                ),
                ListTile(
                  title: const Text('SingUp as supply unit'),
                  leading: Radio(
                    value: 1,
                    groupValue: SingUpValue,
                    onChanged: (value) {
                      setState(() {
                        SingUpValue = value as int?;
                        print('===================================');
                        print(SingUpValue);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('SingUp as nurse'),
                  leading: Radio(
                    value: 2,
                    groupValue: SingUpValue,
                    onChanged: (value) {
                      setState(() {
                        SingUpValue = value as int?;
                        print('===================================');
                        print(SingUpValue);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('SingUp as pharmacy'),
                  leading: Radio(
                    value: 3,
                    groupValue: SingUpValue,
                    onChanged: (value) {
                      setState(() {
                        SingUpValue = value as int?;
                        print('===================================');
                        print(SingUpValue);
                      });
                    },
                  ),
                ),
                ListTile(
                  //amir part 3
                  title: const Text('SingUp as admin'),
                  leading: Radio(
                    value: 4,
                    groupValue: SingUpValue,
                    onChanged: (value) {
                      setState(() {
                        SingUpValue = value as int?;
                        print('===================================');
                        print(SingUpValue);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('SingUp as doctor'),
                  leading: Radio(
                    value: 5,
                    groupValue: SingUpValue,
                    onChanged: (value) {
                      setState(() {
                        SingUpValue = value as int?;
                        print('===================================');
                        print(SingUpValue);
                      });
                    },
                  ),
                ),
                Divider(thickness: 2),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    const Text('I have acount ?',
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: const Text(
                        'SingIn ',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return MyApp();
                        }));
                      },
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await SingUPUser(SingUpValue!);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) {
                      return MyApp();
                    }));
                  },
                  icon: const Icon(Icons.add_task_sharp),
                  label: const Text("SingUp"),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                  ),
                ),
                IconButton(
                  onPressed: () => exit(0),
                  icon: const Icon(Icons.healing),
                ),
                Text("$str"),
                const SizedBox(
                  height: 180,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            regdark = !regdark;
          });
        },
        child: regdark
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
        highlightElevation: 45, //note this
        backgroundColor: Colors.purple,
      ),
    );
  }
}
