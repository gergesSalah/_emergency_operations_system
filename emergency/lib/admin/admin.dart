import 'package:emergency/admin/operation%20sheets.dart';
import 'package:emergency/registeration/regiteration.dart';
// import 'package:emergency/rooms/room.dart';
import 'package:emergency/nurse/nurse.dart';
import 'package:emergency/pharmcy/pharmcy.dart';
import 'package:emergency/suppliesUnit/supplies.dart';
import 'package:flutter/material.dart';

import '../room/room.dart';
import '../room/roomState.dart';

var dark = false;
var texclr = Colors.purple;
var focsbordersClr = Color.fromARGB(255, 48, 135, 241);
var iconclr = Colors.purple;
var datebtnclr = Colors.purpleAccent;

class adminpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {
  Widget buttons(String lable, Icons, i) {
    final shape = StadiumBorder();
    return Row(children: [
      Expanded(
        // child: Container(
        //   height: 70,
        //   margin: const EdgeInsets.all(10),
        child: Material(
          color: Colors.transparent,
          shape: shape,
          elevation: 8,
          child: Container(
            // width: 300,
            // height: 60,
            decoration: ShapeDecoration(
              shape: shape,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.purple,
                  // Color.fromARGB(255, 112, 28, 127),
                  // Colors.blue,
                  // Color.fromARGB(255, 132, 0, 156),
                  Color.fromARGB(255, 235, 124, 255),
                  Color.fromARGB(255, 234, 112, 255),
                  Color.fromARGB(255, 73, 0, 86),
                  // Colors.blue
                ],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (i == 1) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return MyApp1();
                  }));
                }
                if (i == 2) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return supplies();
                  }));
                }
                if (i == 3) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return pharmcy();
                  }));
                }
                if (i == 4) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return operationsheets();
                  }));
                }
                if (i == 5) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Room();
                  }));
                }
                if (i == 6) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return roomState();
                  }));
                }
              },
              // icon: Icons,
              // label: Padding(
              //   padding: const EdgeInsets.only(
              //     right: 55,
              //     bottom: 7,
              //   ),
              //   child: Text(
              //     "$lable",
              //     style: TextStyle(fontSize: 27),
              //   ),
              // ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 24, vertical: 15), //////////////////

                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                "$lable",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              // style: ButtonStyle(
              //   overlayColor: MaterialStateProperty.all(Colors.purple[200]),
              //   shape: MaterialStateProperty.all(
              //     const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(40),
              //         topLeft: Radius.circular(20),
              //         topRight: Radius.circular(40),
              //         bottomRight: Radius.circular(20),
              //       ),
              //       side: BorderSide(color: Colors.blue, width: 1),
              //     ),
              //   ),
              //   elevation: MaterialStateProperty.all(20),
              //   shadowColor: MaterialStateProperty.all(Colors.blue),
              //   foregroundColor: MaterialStateProperty.all(Colors.black),
              //   backgroundColor:
              //       MaterialStateProperty.all(dark ? datebtnclr : focsbordersClr),
              // ),
            ),
          ),
        ),
      ),
      // ),
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("admin page",
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
        height: 900,
        color: dark ? Colors.grey[800] : Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 60,
            ),
            buttons("Register", const Icon(Icons.input), 1),
            const SizedBox(
              height: 40,
            ),
            buttons("Supply Unit", const Icon(Icons.support), 2),
            const SizedBox(
              height: 40,
            ),
            buttons("pharmacy", const Icon(Icons.medical_services), 3),
            const SizedBox(
              height: 40,
            ),
            buttons("Operation sheet", const Icon(Icons.receipt_long_sharp), 4),
            const SizedBox(
              height: 40,
            ),
            buttons("Operations Rooms", const Icon(Icons.settings), 5),
            const SizedBox(
              height: 40,
            ),
            buttons("Operations Rooms State", const Icon(Icons.roofing), 6),
            const SizedBox(
              height: 40,
            ),
          ]),
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
