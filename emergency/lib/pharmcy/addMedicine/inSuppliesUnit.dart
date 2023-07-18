import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

var mood = const ColorScheme.highContrastDark();
var dark = true;
var mycontroler = TextEditingController();
var str = "";

var texclr = Colors.purple;
var focsbordersClr = Color.fromARGB(255, 48, 135, 241);
var iconclr = Colors.purple;

var datebtnclr = Colors.deepPurpleAccent;

// var icon = const Icon(Icons.visibility);
// var invisicon = const Icon(Icons.visibility_off);

final String secondColor = "purple";

class addMedicinInsuppliesStatefull extends StatefulWidget {
  @override
  _addMedicinInsuppliesState createState() => _addMedicinInsuppliesState();
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

class _addMedicinInsuppliesState extends State<addMedicinInsuppliesStatefull> {
  // def() {
  //   print("object");
  // }
  DateTime? _selectedDate;
  bool Dateflag = false;

  var name = TextEditingController();
  var quantity = TextEditingController();
  var code = TextEditingController();
  var details = TextEditingController();
  String? Date;

  CollectionReference user1 =
      FirebaseFirestore.instance.collection('medicineStore');
  CollectionReference user2 =
      FirebaseFirestore.instance.collection('medicalsupplyUnit');

  int currentcount = 0;

  UpdateUnit(name, quantity, code, details, Date) async {
    String id = '';
    bool exesitdrug = false;
    currentcount = 0;
    await user1.where('Name', isEqualTo: name).get().then((value) {
      // exesitdrug = true;
      // currentcount == 0;
      value.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        if (data['Name'] == name &&
            data['quantity'] > 0 &&
            data['quantity'] - int.parse(quantity) >= 0) {
          exesitdrug = true;
          print("the exesitdrug in side the func = $exesitdrug");
          print("the currentcount in side the func = $exesitdrug");
          print(
              "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          setState(() {
            id = element.id;
            // print("before ${data['quantity']}");
            // print("================================");
            currentcount = data['quantity'];
            // print("currentcount = $currentcount");
            currentcount = currentcount - int.parse(quantity);
            // print("currentcount afteredit = $currentcount");
            user1.doc(id).update({'quantity': currentcount});
            // print(id);

            // return data[]
            if (currentcount == 0) currentcount = -1;
          });
        }

        // print("================================");
        // print("after ${data['quantity']}");
        // print("================================");
      });
    });

    print("the exesitdrug out side the func = $exesitdrug");
    print("the currentcount out side the func = $exesitdrug");
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++");

    if (exesitdrug == false) {
      currentcount = 0;
      print("the exesitdrug in side the if statement = $exesitdrug");
      print("the currentcount in side the if statement  = $exesitdrug");
      print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    } else {
      user2.add({
        'Name': name,
        'quantity': num.parse(quantity),
        'code': code,
        'details': details,
        'Date': Date
      });
    }
    return currentcount;
  }

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
          Date = value.toString();
          Dateflag = true;
        }
      });
    });
  }

  var passwordvisb = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("add in drug shelves",
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
            color: dark ? Color.fromRGBO(48, 48, 48, 255) : Colors.grey[800],
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: " Name",
                      // label: Text("Name"),
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "wrtie the supply's name",
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: " quantity",
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "write a medicine's quantity",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.add_to_photos_sharp,
                        color: iconclr,
                      ),
                      helperText: "write a medicine's quantity",
                      // prefix: Text("+02  "),
                    ),
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.dark,
                    controller: quantity,
                    //textAlign: TextAlign.center,
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: " code",
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "write a medicine's code",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.qr_code,
                        color: iconclr,
                      ),
                      helperText: "write a medicine's code",
                      // prefix: Text("+02  "),
                    ),
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.dark,
                    controller: code,
                    //textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      // alignLabelWithHint: true,
                      labelText: " details",
                      labelStyle: TextStyle(color: texclr, fontSize: 30),
                      hintText: "write details of medicine",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      icon: Icon(
                        Icons.details,
                        color: iconclr,
                      ),
                      helperText: "write details of medicine ,if you want",
                    ),
                    keyboardType: TextInputType.text,
                    keyboardAppearance: Brightness.dark,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 800,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.date_range),
                      ),
                      Container(
                        width: 300,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: _datePicker,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                right: 55,
                                bottom: 7, /*top: 10*/
                              ),
                              // bool txt= new _selectedDate!;
                              child: Text(
                                Dateflag
                                    ? "${intl.DateFormat.yMd().format(_selectedDate!)}"
                                    : "pick the Date",
                                style: TextStyle(fontSize: 27),
                              )),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.purple[200]),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(20),
                                ),
                                side: BorderSide(color: Colors.blue, width: 1),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(20),
                            shadowColor: MaterialStateProperty.all(Colors.blue),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            backgroundColor: MaterialStateProperty.all(
                                dark ? datebtnclr : focsbordersClr),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    int currentcount = await UpdateUnit(
                        name.text,
                        quantity.text,
                        num.parse(code.text),
                        details.text,
                        Date);

                    print(
                        "countofnthspoint in the desgin before the if statements = $currentcount");
                    setState(() {
                      name = TextEditingController();
                      quantity = TextEditingController();
                      code = TextEditingController();
                      details = TextEditingController();
                      Date;
                    });
                    if (currentcount == 0) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title:
                              Text("This quantity is not available in store"),
                          content: const Text(
                              'blease, add more quantity of this drug in your store '),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                    if (currentcount <= 5 && currentcount > (0)) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                              "note the count of this drug = $currentcount "),
                          content: const Text(
                              'blease, add more quantity of this drug in your store '),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                    if (currentcount == -1) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                              "note the count of this drug ,now = 0 "),
                          content: const Text(
                              'blease, add more quantity of this drug in your store '),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.add_task_sharp),
                  label: const Text("Done"),
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
                  height: 100,
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
