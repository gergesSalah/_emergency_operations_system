import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

// import '../login/login.dart';
// import 'package:login_regest/login.dart';

class addSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _addSheetState();
}

class _addSheetState extends State<addSheet> {
  var patient = TextEditingController();
  var operation = TextEditingController();
  var doctor = TextEditingController();
  var doctorAsist = TextEditingController();
  var Anesthetist = TextEditingController();
  var nurse = TextEditingController();
  var ticketNum = TextEditingController();
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
  ];
  String? Date;

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
        decoration: const InputDecoration(
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
          if (value == "") value = 0.toString();
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
          labelText: "       doctor",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 132, 33, 149),
              fontSize: 19,
              fontWeight: FontWeight.bold),
          hintText: "a doctor name",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          helperText: "enter the doctor name",
        ),
        keyboardType: TextInputType.emailAddress,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        controller: doctor,
      ),
    );
  }

  Widget nurseSignature_builtrow(/*String title*/) {
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
          labelText: "        nurse",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 132, 33, 149),
              fontSize: 19,
              fontWeight: FontWeight.bold),
          hintText: "a nurse name",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          helperText: "enter the nurse name",
        ),
        keyboardType: TextInputType.emailAddress,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        controller: nurse,
      ),
    );
  }

  Widget patientSignature_builtrow(/*String title*/) {
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
          labelText: "      patient",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 132, 33, 149),
              fontSize: 18,
              fontWeight: FontWeight.bold),
          hintText: "a patient name",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          helperText: "enter the patient name",
        ),
        keyboardType: TextInputType.emailAddress,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        controller: patient,
      ),
    );
  }

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
        controller: operation,
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
        controller: doctorAsist,
      ),
    );
  }

  Widget AnestheSignature_builtrow(/*String title*/) {
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
          labelText: "Anesthetist",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 132, 33, 149),
              fontSize: 17,
              fontWeight: FontWeight.bold),
          hintText: "a Anesthetist name",
          hintStyle: TextStyle(color: Colors.blueGrey),
          // icon: Icon(Icons.alternate_email),
          helperText: "enter the Anesthetist name",
        ),
        keyboardType: TextInputType.emailAddress,
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        controller: Anesthetist,
      ),
    );
  }

  Widget Date_builtrow(/*String title*/) {
    // final iti = title;
    return Container(
      width: 175,
      height: 60,
      child: ElevatedButton(
        onPressed: _datePicker,
        child: Padding(
          padding: EdgeInsets.only(
            right: 55,
            bottom: 7, /*top: 10*/
          ),
          // bool txt= new _selectedDate!;
          child: Text(
            Dateflag
                ? "${intl.DateFormat.yMd().format(_selectedDate!)}"
                : "pick the Date",
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
        controller: ticketNum,
      ),
    );
  }

  Widget confirmButton_builtrow() {
    // final iti = title;
    return Container(
      width: 250,
      child: FloatingActionButton.extended(
        heroTag: "confirm",
        label: const Text("confirm"),
        onPressed: () async {
          final String patientName = patient.text;
          final String operatioinName = operation.text;
          final String doctorName = doctor.text;
          final String doctorAsistName = doctorAsist.text;
          final String anesthetistname = Anesthetist.text;
          final String nurseName = nurse.text;
          final String ticketNumber = ticketNum.text;
          final String dateDoc = intl.DateFormat.yMd().format(_selectedDate!);
          if (patientName == "") {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('blease insert the medical officials name'),
                content:
                    const Text('medical officials : in the bottom of page'),
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
          } else {
            // for (int i = 0; i < count.length; i++) {
            // print(
            //     "++++++++++++++++++++++++++++++++++=+++++++++++++++++++++++++++");
            // print("in for loop $i");
            // // count.add(0);
            // // price.add("0");
            // // if (count[i])
            // print("name : ${name[i + 1]}");
            // print("conunt : ${count[i]}");
            // print("price : ${price[i]}");
            // print(
            //     "+++++++++++++++++++++++++++++++++++++++++===+++++++++++++++++++++++");
            await UpdateUnit(
              name, //name[i + 1],
              count, //count[i],
              price, //price[i],
              dateDoc,
              patientName,
              operatioinName,
              doctorName,
              doctorAsistName,
              anesthetistname,
              nurseName,
              ticketNumber,
            );
            setState(() {
              /////////////////////////////////hereeeeeeeeeeeeeeeeeeee we can make it delete automatically

              price = [
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
              count = [
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
              patient = TextEditingController();
              operation = TextEditingController();
              doctor = TextEditingController();
              doctorAsist = TextEditingController();
              Anesthetist = TextEditingController();
              nurse = TextEditingController();
              ticketNum = TextEditingController();
              Date;
            });
            // }
          }
        },
        icon: const Icon(Icons.send),
        foregroundColor: Colors.lightGreenAccent[600],
        backgroundColor: Colors.green[800],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(55),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(55),
          ),
          side: BorderSide(color: Colors.green, width: 1),
        ),
        splashColor: Colors.lightGreenAccent[400],
      ),
    );
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("create operation sheet",
            style: TextStyle(color: Colors.black, fontSize: 24)),
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
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return i == name.length - 1
              ? Container(
                  margin: EdgeInsets.only(top: 70, bottom: 50),
                  child: Table(
                    children: [
                      TableRow(children: [
                        patientSignature_builtrow(),
                        operation_builtrow(),
                        // builtrow_4(i.toString()),
                      ]),
                      TableRow(children: [
                        docSignature_builtrow(),
                        assistSignature_builtrow(),
                        // builtrow_4(i.toString()),
                      ]),
                      TableRow(children: [
                        AnestheSignature_builtrow(),
                        nurseSignature_builtrow(),
                      ]),
                      TableRow(children: [
                        ticket_builtrow(),
                        Date_builtrow(),
                      ]),
                      TableRow(children: [
                        confirmButton_builtrow(),
                        exsitButton_builtrow(),
                      ])
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
                            builtrow_1(i - 1),
                            builtrow_2(i - 1),
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
