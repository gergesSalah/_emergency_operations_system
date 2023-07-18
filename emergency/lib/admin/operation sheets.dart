import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency/admin/admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

// import '../login/login.dart';
// import 'package:login_regest/login.dart';

class operationsheets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _operationsheetsState();
}

class _operationsheetsState extends State<operationsheets> {
  bool thisDocExsit = false;

  var patient = "";
  var operation = "";
  var doctor = "";
  var doctorAsist = "";
  var Anesthetist = "";
  var nurse = "";
  var ticketNum = "";
  String? Date;
  // var price = TextEditingController();
  List<String> name = [
    "",
    " 50 ثيونتال",
    "كتلار",
    "بافلون",
    "سكسنيل سم",
    "هالوثان سم",
    "ايزوفوران سم",
    "اتروبين",
    "نيوستجمين",
    "تراكيم",
    "جلاكسو",
    "افدرين",
    "جلامين",
    "ديبرفان",
    "هيموستوب",
    "بيوكين",
    "بيوكين فيال",
    "بيثيدين",
    "ترامادول",
    "نيوبين",
    "دورميكم",
    "ايتافيللين",
    "كالهبارين",
    "نوسبا",
    "ادرينالين",
    "سينتوسينون",
    "ميثرجين",
    "فسرالجين",
    "رانتدين",
    "لافيكوركس",
    "ابيكتيل",
    "فاليم",
    "كابرون",
    "فلاجيل",
    "ابيدرون",
    "محلول ملح",
    "daplicated value byme"
  ];
  List<String> price = [
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0"
  ];
  List<int> count = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  CollectionReference suppliesUnit =
      FirebaseFirestore.instance.collection('medicalsupplyUnit');
  CollectionReference operationSheet =
      FirebaseFirestore.instance.collection('operationSheets');

  UpdateUnit(name, quantity, price, Date, patient, operation, doctor,
      doctorAsist, Anesthetist, nurse, ticketNum) async {
    String id = '';

    for (int i = 1; i < name.length - 2; i++) {
      suppliesUnit.where('Name', isEqualTo: name[i]).get().then((value) {
        value.docs.forEach((element) {
          var data = element.data() as Map<String, dynamic>;
          if (data['Name'] == name[i]) {
            setState(() {
              id = element.id;
              print("=======================================");
              print("in updateUnit function ");
              print(data['quantity']);
              print("=======================================");
              suppliesUnit
                  .doc(id)
                  .update({'quantity': data['quantity'] - quantity[i - 1]});
              print(id);

              print(
                  "============================+================================");
              print(suppliesUnit.doc(id));
              print(
                  "============================+================================");
            });
          }
        });
      });
    }

    await operationSheet.add({
      for (int i = 1; i <= name.length - 2; i++) 'medicine $i': name[i],
      for (int i = 1; i <= name.length - 2; i++)
        'quantity of medicine $i': quantity[i - 1],
      for (int i = 1; i <= name.length - 2; i++)
        'price of medicine $i': num.parse(price[i - 1]),
      // 'details': details,
      'patient Name': patient,
      'operation': operation,
      'doctor': doctor,
      'doctor Assistant': doctorAsist,
      'Anesthetist': Anesthetist,
      'nurse': nurse,
      'ticket number': ticketNum,
      'Date': Date,
    });
  }

  var pric = 0, quant = 0, sum = 0;

  //price

  Widget builtrow_head1(title) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    );
  }

//quantity
  Widget builtrow_head2(title) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    );
  }

//items
  Widget builtrow_head3(String title) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    );
  }

//iD
  Widget builtrow_head4(String title) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    );
  }

  Widget builtrow_1(int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      margin: const EdgeInsets.all(1),
      child: TextField(
        // autocorrect: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          // alignLabelWithHint: true,
          // labelText: " gmail",
          labelStyle: TextStyle(color: Colors.amber, fontSize: 30),
          // hintText: "enter your gmail",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          // helperText: "help enter your gmail with keyboard",
        ),
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        onSubmitted: (String value) {
          // if (value == "") {
          //   price.add("0");
          // } else {
          // price.add(value);

          print(
              "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          print(
              "the price list before insert vaLue in index :($index) = $price ");
          print(
              "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          print(
              "after remove element in index $index to replacment it with $value");
          price.removeAt(index);
          print(price);
          // print(
          //     "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          price.insert(index, value);
          print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          print(
              "the price list after insert vaLue in index :($index) = $price ");
          print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          // }
        },
        // controller: TextEditingController(text: "0"),
      ),
    );
  }

//quantity
  Widget builtrow_2(int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      margin: const EdgeInsets.all(1),
      child: TextField(
        // autocorrect: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          // alignLabelWithHint: true,
          // labelText: " gmail",
          labelStyle: TextStyle(color: Colors.amber, fontSize: 30),
          // hintText: "enter your gmail",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          // helperText: "help enter your gmail with keyboard",
        ),
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        onSubmitted: (String value) {
          // if (value == "") {
          //   count.add(0);
          // } else {
          // count.add(int.parse(value));

          print(
              "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          print(
              "the count list before insert vaLue in index :($index) = $count ");
          print(
              "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          print(
              "after remove element in index $index to replacment it with $value");
          count.removeAt(index);
          print(price);
          // print(
          //     "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          count.insert(index, int.parse(value));
          print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          print(
              "the count list after insert vaLue in index :($index) = $count ");
          print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

          // count.insert(index, int.parse(value));
          // print("++++++++++++++++++++++++++++++++++++++++++++++++");
          // print(count);
          // print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

          // }
        },
        // controller: TextEditingController(text: "0"),
      ),
    );
  }

//items
  Widget builtrow_3(String items) {
    return Container(
      margin: EdgeInsets.all(1),
      height: 50,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          items,
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Colors.blue)
          // color: Color.fromARGB(255, 180, 131, 204)
          // gradient: LinearGradient(colors: [
          //   Colors.white,
          //   // Colors.white,
          //   Color.fromARGB(255, 178, 150, 255),
          //   Colors.blue,
          //   Colors.blue,
          // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.blueGrey,
          //     blurRadius: 12,
          //     offset: Offset(0, 6),
          //   )
          // ],
          ),
    );
  }

//iD
  Widget builtrow_4(String id) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          id,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.blueGrey,
        //     blurRadius: 12,
        //     offset: Offset(0, 6),
        //   )
        // ],
      ),
    );
  }

  Widget docSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            "doctor                              $doctor",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  Widget operationSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            "operation                            $operation",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  Widget patientSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            "patient                        $patient",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  Widget docasistSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            " doctor asistant         $doctorAsist",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  Widget AnestheSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            "Anesthetist               $Anesthetist",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  Widget nurseSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            "nurse                      $nurse",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  Widget ticketnumSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            "ticket number                          $ticketNum",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  Widget DateSignature_builtrow(/*String title*/) {
    // final iti = title;
    final shape = StadiumBorder();
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: Container(
        width: 175,
        height: 60,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            Dateflag
                ? "date: ${intl.DateFormat.yMd().format(_selectedDate!)}"
                : "date              $Date",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(colors: [
            // Colors.purple,
            // Color.fromARGB(255, 112, 28, 127),
            // Colors.blue,
            // Color.fromARGB(255, 132, 0, 156),
            Color.fromARGB(255, 123, 1, 145),
            Color.fromARGB(255, 4, 92, 187),
            Color.fromARGB(255, 112, 198, 255),
            Color.fromARGB(255, 73, 0, 86),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ],
        ),
      ),
    );
  }

  // Widget nurseSignature_builtrow(/*String title*/) {
  //   // final iti = title;
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     child: TextField(
  //       // autocorrect: true,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderSide: BorderSide(width: 2),
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(40),
  //             bottomLeft: Radius.circular(40),
  //             bottomRight: Radius.circular(20),
  //           ),
  //         ),
  //         // alignLabelWithHint: true,
  //         labelText: "        nurse",
  //         labelStyle: TextStyle(
  //             color: Color.fromARGB(255, 132, 33, 149),
  //             fontSize: 19,
  //             fontWeight: FontWeight.bold),
  //         hintText: "a nurse name",
  //         hintStyle: TextStyle(color: Colors.blueGrey),
  //         // icon: Icon(Icons.alternate_email),
  //         helperText: "enter the nurse name",
  //       ),
  //       keyboardType: TextInputType.emailAddress,
  //       keyboardAppearance: Brightness.dark,
  //       textAlign: TextAlign.center,
  //       // controller: nurse,
  //     ),
  //   );
  // }

  // Widget patientSignature_builtrow(/*String title*/) {
  //   // final iti = title;
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     child: TextField(
  //       // autocorrect: true,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderSide: BorderSide(width: 2),
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(40),
  //             bottomLeft: Radius.circular(40),
  //             bottomRight: Radius.circular(20),
  //           ),
  //         ),
  //         // alignLabelWithHint: true,
  //         labelText: "      patient",
  //         labelStyle: TextStyle(
  //             color: Color.fromARGB(255, 132, 33, 149),
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold),
  //         hintText: "a patient name",
  //         hintStyle: TextStyle(color: Colors.blueGrey),
  //         // icon: Icon(Icons.alternate_email),
  //         helperText: "enter the patient name",
  //       ),
  //       keyboardType: TextInputType.emailAddress,
  //       keyboardAppearance: Brightness.dark,
  //       textAlign: TextAlign.center,
  //       // controller: patient,
  //     ),
  //   );
  // }

  Widget operation_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
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
          // alignLabelWithHint: true,
          labelText: "     operation",
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 132, 33, 149),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          hintText: "a operation name",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          helperText: "enter the operation name",
        ),
        keyboardType: TextInputType.emailAddress,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        // controller: operation,
      ),
    );
  }

  Widget assistSignature_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
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
          // alignLabelWithHint: true,
          labelText: "doctor assistant",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 132, 33, 149),
              fontSize: 17,
              fontWeight: FontWeight.bold),
          hintText: "a assistant name",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          helperText: "enter the assistant name",
        ),
        keyboardType: TextInputType.emailAddress,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        // controller: doctorAsist,
      ),
    );
  }

  // Widget AnestheSignature_builtrow(/*String title*/) {
  //   // final iti = title;
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     child: TextField(
  //       // autocorrect: true,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderSide: BorderSide(width: 2),
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(40),
  //             bottomLeft: Radius.circular(40),
  //             bottomRight: Radius.circular(20),
  //           ),
  //         ),
  //         // alignLabelWithHint: true,
  //         labelText: "Anesthetist",
  //         labelStyle: TextStyle(
  //             color: Color.fromARGB(255, 132, 33, 149),
  //             fontSize: 17,
  //             fontWeight: FontWeight.bold),
  //         hintText: "a Anesthetist name",
  //         hintStyle: TextStyle(color: Colors.blueGrey),
  //         // icon: Icon(Icons.alternate_email),
  //         helperText: "enter the Anesthetist name",
  //       ),
  //       keyboardType: TextInputType.emailAddress,
  //       keyboardAppearance: Brightness.dark,
  //       textAlign: TextAlign.center,
  //       // controller: Anesthetist,
  //     ),
  //   );
  // }

  Widget document1_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc1retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 1",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget document2_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc2retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 2",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget document3_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc3retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 3",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget document4_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc4retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 4",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget document5_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc5retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 5",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget document6_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc6retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 6",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget document7_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc7retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 7",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget document8_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: doc8retrieve,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            "sheet 8",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 144, 240, 255)),
            textAlign: TextAlign.center,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(20),
              ),
              side: BorderSide(
                  color: Color.fromARGB(255, 144, 240, 255), width: 1),
            ),
          ),
        ),
      ),
    );
  }
  // Widget document9_builtrow(/*String title*/) {
  //   // final iti = title;
  //   return Container(
  //     width: 175,
  //     height: 60,
  //     child: ElevatedButton(
  //       onPressed: doc9retrieve,
  //       child: Padding(
  //         padding: EdgeInsets.only(
  //           right: 55,
  //           bottom: 7, /*top: 10*/
  //         ),
  //         // bool txt= new _selectedDate!;
  //         child: Text(
  //               "sheet 9",
  //           style: TextStyle(
  //               fontSize: 17,
  //               fontWeight: FontWeight.bold,
  //               color: Color.fromARGB(255, 144, 240, 255)),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
  //         overlayColor: MaterialStateProperty.all(Colors.blue),
  //         shape: MaterialStateProperty.all(
  //           const RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(40),
  //               topLeft: Radius.circular(20),
  //               topRight: Radius.circular(40),
  //               bottomRight: Radius.circular(20),
  //             ),
  //             side: BorderSide(
  //                 color: Color.fromARGB(255, 144, 240, 255), width: 1),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget ticket_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
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
          // alignLabelWithHint: true,
          labelText: "ticket numnber",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 132, 33, 149),
              fontSize: 17,
              fontWeight: FontWeight.bold),
          hintText: "a ticket number",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          helperText: "enter the ticket number",
        ),
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        // controller: ticketNum,
      ),
    );
  }

  // Widget confirmButton_builtrow() {
  //   // final iti = title;
  //   return Container(
  //     width: 250,
  //     child: FloatingActionButton.extended(
  //       heroTag: "confirm",
  //       label: const Text("confirm"),
  //       onPressed: () async {
  //         final String patientName = patient.text;
  //         final String operatioinName = operation.text;
  //         final String doctorName = doctor.text;
  //         final String doctorAsistName = doctorAsist.text;
  //         final String anesthetistname = Anesthetist.text;
  //         final String nurseName = nurse.text;
  //         final String ticketNumber = ticketNum.text;
  //         final String dateDoc = intl.DateFormat.yMd().format(_selectedDate!);
  //         if (patientName == "") {
  //           showDialog<String>(
  //             context: context,
  //             builder: (BuildContext context) => AlertDialog(
  //               title: const Text('blease insert the medical officials name'),
  //               content:
  //                   const Text('medical officials : in the bottom of page'),
  //               actions: <Widget>[
  //                 TextButton(
  //                   onPressed: () => Navigator.pop(context, 'Cancel'),
  //                   child: const Text('Cancel'),
  //                 ),
  //                 TextButton(
  //                   onPressed: () => Navigator.pop(context, 'OK'),
  //                   child: const Text('OK'),
  //                 ),
  //               ],
  //             ),
  //           );
  //         } else {
  //           // for (int i = 0; i < count.length; i++) {
  //           // print(
  //           //     "++++++++++++++++++++++++++++++++++=+++++++++++++++++++++++++++");
  //           // print("in for loop $i");
  //           // // count.add(0);
  //           // // price.add("0");
  //           // // if (count[i])
  //           // print("name : ${name[i + 1]}");
  //           // print("conunt : ${count[i]}");
  //           // print("price : ${price[i]}");
  //           // print(
  //           //     "+++++++++++++++++++++++++++++++++++++++++===+++++++++++++++++++++++");
  //           await UpdateUnit(
  //             name, //name[i + 1],
  //             count, //count[i],
  //             price, //price[i],
  //             dateDoc,
  //             patientName,
  //             operatioinName,
  //             doctorName,
  //             doctorAsistName,
  //             anesthetistname,
  //             nurseName,
  //             ticketNumber,
  //           );
  //           setState(() {
  //             /////////////////////////////////hereeeeeeeeeeeeeeeeeeee we can make it delete automatically

  //             price = [
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0",
  //               "0"
  //             ];
  //             count = [
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //               0,
  //             ];
  //             patient = TextEditingController();
  //             operation = TextEditingController();
  //             doctor = TextEditingController();
  //             doctorAsist = TextEditingController();
  //             Anesthetist = TextEditingController();
  //             nurse = TextEditingController();
  //             ticketNum = TextEditingController();
  //             Date;
  //           });
  //           // }
  //         }
  //       },
  //       icon: const Icon(Icons.send),
  //       foregroundColor: Colors.lightGreenAccent[600],
  //       backgroundColor: Colors.green[800],
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           bottomLeft: Radius.circular(25),
  //           topLeft: Radius.circular(55),
  //           topRight: Radius.circular(25),
  //           bottomRight: Radius.circular(55),
  //         ),
  //         side: BorderSide(color: Colors.green, width: 1),
  //       ),
  //       splashColor: Colors.lightGreenAccent[400],
  //     ),
  //   );
  // }

  Widget exsitButton_builtrow() {
    // final iti = title;
    return Container(
      width: 250,
      child: FloatingActionButton.extended(
        heroTag: "exit",
        label: const Text("exit"), //exit(0);
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Are you sure you want to close the program?'),
              content: const Text(
                  'if you close the programme the data (if any) will be deleted'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => exit(0),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          // setState(() {
          //   /////////////////////////////////hereeeeeeeeeeeeeeeeeeee we can make it delete automatically
          //   // name = [" ", " ", " "];
          //   // count = [0, 0, 0];
          //   // price = ["0", "0", "0"];
          //   // Date;
          // });
        },
        icon: const Icon(Icons.exit_to_app),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 141, 20, 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(55),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(55),
          ),
          side: BorderSide(color: Color.fromARGB(255, 141, 20, 20), width: 2),
        ),
        splashColor: Color.fromARGB(255, 255, 17, 0),
      ),
    );
  }

  //date
  DateTime? _selectedDate;
  bool Dateflag = false;

  void doc1retrieve() async {
    // @override
    // var patient = "";
    // @override
    // var operation = "";
    // @override
    // var doctor = "";
    // @override
    // var doctorAsist = "";
    // @override
    // var Anesthetist = "";
    // @override
    // var nurse = "";
    // @override
    // var ticketNum = "";
    // @override
    // String? Date;

    // patient = "";
    // operation = "";
    // doctor = "";
    // doctorAsist = "";
    // Anesthetist = "";
    // nurse = "";
    // ticketNum = "";
    // Date = "";

    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 2) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";

      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[0]["price of medicine $i"];
        var count = await sheets[0]["quantity of medicine $i"];

        doctorcopy = sheets[0]['doctor'];
        doctorAsistcopy = sheets[0]['doctor Assistant'];
        operationcopy = sheets[0]['operation'];
        patientcopy = sheets[0]['patient Name'];
        Anesthetistcopy = sheets[0]['doctor Assistant'];
        nursecopy = sheets[0]['nurse'];
        ticketNumcopy = sheets[0]['ticket number'].toString();
        Datecopy = sheets[0]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  void doc2retrieve() async {
    thisDocExsit = false;
    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 2) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";
      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[1]["price of medicine $i"];
        var count = await sheets[1]["quantity of medicine $i"];

        doctorcopy = sheets[1]['doctor'];
        doctorAsistcopy = sheets[1]['doctor Assistant'];
        operationcopy = sheets[1]['operation'];
        patientcopy = sheets[1]['patient Name'];
        Anesthetistcopy = sheets[1]['doctor Assistant'];
        nursecopy = sheets[1]['nurse'];
        print(sheets[1]['ticket number'].toString());
        ticketNumcopy = sheets[1]['ticket number'].toString();
        print(ticketNumcopy);
        Datecopy = sheets[1]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        thisDocExsit = true;
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
        print("nurse = $nurse");
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  void doc3retrieve() async {
    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 3) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";

      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[2]["price of medicine $i"];
        var count = await sheets[2]["quantity of medicine $i"];

        doctorcopy = sheets[2]['doctor'];
        doctorAsistcopy = sheets[2]['doctor Assistant'];
        operationcopy = sheets[2]['operation'];
        patientcopy = sheets[2]['patient Name'];
        Anesthetistcopy = sheets[2]['doctor Assistant'];
        nursecopy = sheets[2]['nurse'];
        ticketNumcopy = sheets[2]['ticket number'].toString();
        Datecopy = sheets[2]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        thisDocExsit = true;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  void doc4retrieve() async {
    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 3) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";

      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[3]["price of medicine $i"];
        var count = await sheets[3]["quantity of medicine $i"];

        doctorcopy = sheets[3]['doctor'];
        doctorAsistcopy = sheets[3]['doctor Assistant'];
        operationcopy = sheets[3]['operation'];
        patientcopy = sheets[3]['patient Name'];
        Anesthetistcopy = sheets[3]['doctor Assistant'];
        nursecopy = sheets[3]['nurse'];
        ticketNumcopy = sheets[3]['ticket number'].toString();
        Datecopy = sheets[3]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
        thisDocExsit = true;
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  void doc5retrieve() async {
    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 3) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";

      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[4]["price of medicine $i"];
        var count = await sheets[4]["quantity of medicine $i"];

        doctorcopy = sheets[4]['doctor'];
        doctorAsistcopy = sheets[4]['doctor Assistant'];
        operationcopy = sheets[4]['operation'];
        patientcopy = sheets[4]['patient Name'];
        Anesthetistcopy = sheets[4]['doctor Assistant'];
        nursecopy = sheets[4]['nurse'];
        ticketNumcopy = sheets[4]['ticket number'].toString();
        Datecopy = sheets[4]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
        thisDocExsit = true;
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  void doc6retrieve() async {
    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 3) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";

      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[5]["price of medicine $i"];
        var count = await sheets[5]["quantity of medicine $i"];

        doctorcopy = sheets[5]['doctor'];
        doctorAsistcopy = sheets[5]['doctor Assistant'];
        operationcopy = sheets[5]['operation'];
        patientcopy = sheets[5]['patient Name'];
        Anesthetistcopy = sheets[5]['doctor Assistant'];
        nursecopy = sheets[5]['nurse'];
        ticketNumcopy = sheets[5]['ticket number'].toString();
        Datecopy = sheets[5]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
        thisDocExsit = true;
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  void doc7retrieve() async {
    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 3) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";

      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[6]["price of medicine $i"];
        var count = await sheets[6]["quantity of medicine $i"];

        doctorcopy = sheets[6]['doctor'];
        doctorAsistcopy = sheets[6]['doctor Assistant'];
        operationcopy = sheets[6]['operation'];
        patientcopy = sheets[6]['patient Name'];
        Anesthetistcopy = sheets[6]['doctor Assistant'];
        nursecopy = sheets[6]['nurse'];
        ticketNumcopy = sheets[6]['ticket number'].toString();
        Datecopy = sheets[6]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
        thisDocExsit = true;
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  void doc8retrieve() async {
    CollectionReference operationsheets =
        FirebaseFirestore.instance.collection("operationSheets");
    List sheets = [];

    var responsebody = await operationsheets.get();
    responsebody.docs.forEach((element) {
      sheets.add(element.data());
    });

    if (sheets.length >= 3) {
      List<String> pricecopyforsetstate = await price;
      List<int> countscopyforsetstate = await count;
      var patientcopy = "";
      var operationcopy = "";
      var doctorcopy = "";
      var doctorAsistcopy = "";
      var Anesthetistcopy = "";
      var nursecopy = "";
      var ticketNumcopy = "";
      var Datecopy = "";

      for (int i = 1; i <= 35; i++) {
        pricecopyforsetstate.removeAt(i);
        countscopyforsetstate.removeAt(i);

        var price = await sheets[7]["price of medicine $i"];
        var count = await sheets[7]["quantity of medicine $i"];

        doctorcopy = sheets[7]['doctor'];
        doctorAsistcopy = sheets[7]['doctor Assistant'];
        operationcopy = sheets[7]['operation'];
        patientcopy = sheets[7]['patient Name'];
        Anesthetistcopy = sheets[7]['doctor Assistant'];
        nursecopy = sheets[7]['nurse'];
        ticketNumcopy = sheets[7]['ticket number'].toString();
        Datecopy = sheets[7]['Date'];

        pricecopyforsetstate.insert(i, price.toString());
        countscopyforsetstate.insert(i, count);
      }

      setState(() {
        price = pricecopyforsetstate;
        count = countscopyforsetstate;
        doctor = doctorcopy;
        patient = patientcopy;
        operation = operationcopy;
        ticketNum = ticketNumcopy;
        doctorAsist = doctorAsistcopy;
        Anesthetist = Anesthetistcopy;
        nurse = nursecopy;
        Date = Datecopy;
        thisDocExsit = true;
      });
    } else {
      setState(() {
        thisDocExsit = false;
      });
    }
  }

  var passwordvisb = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "operation sheet",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return i == name.length - 1 //35
              ? Container(
                  margin: EdgeInsets.only(top: 70, bottom: 50),
                  child: Table(
                    children: [
                      TableRow(children: [
                        docSignature_builtrow(),
                        patientSignature_builtrow(),
                      ]),
                      TableRow(children: [
                        nurseSignature_builtrow(),
                        operationSignature_builtrow(),
                      ]),
                      TableRow(children: [
                        docasistSignature_builtrow(),
                        AnestheSignature_builtrow(),
                      ]),
                      TableRow(children: [
                        ticketnumSignature_builtrow(),
                        DateSignature_builtrow(),
                      ]),
                      TableRow(children: [
                        document1_builtrow(),
                        document2_builtrow(),
                        // builtrow_4(i.toString()),
                      ]),
                      TableRow(children: [
                        document3_builtrow(),
                        document4_builtrow(),
                        // builtrow_4(i.toString()),
                      ]),
                      TableRow(children: [
                        document5_builtrow(),
                        document6_builtrow(),
                      ]),
                      TableRow(children: [
                        document7_builtrow(),
                        document8_builtrow(),
                      ]),
                    ],
                  ),
                )
              : Table(
                  children: [
                    i == 0
                        ? TableRow(children: [
                            builtrow_head1("price"),
                            builtrow_head2("count"),
                            builtrow_head3("name"),
                            builtrow_head4("ID"),
                          ])
                        : TableRow(children: [
                            builtrow_3(price[i]),
                            builtrow_3(count[i].toString()),
                            builtrow_3(name[i]),
                            builtrow_4(i.toString()),
                          ]),
                  ],
                );
        },
      ),
    );
  }
}
