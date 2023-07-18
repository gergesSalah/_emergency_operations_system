import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../admin/admin.dart';

class roomState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: roomPage(),
    );
  }
}

class roomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => roomHome();
}

class roomHome extends State<roomPage> {
  int id1 = 0;
  int id2 = 0;
  int id3 = 0;
  int id4 = 0;
  Color statecolorColor1 = Colors.white;
  Color statecolorColor2 = Colors.white;
  Color statecolorColor3 = Colors.white;
  Color statecolorColor4 = Colors.white;
  Color co1 = const Color.fromARGB(255, 86, 194, 90);
  Color co2 = const Color.fromARGB(255, 236, 83, 72);
  Color co3 = const Color.fromARGB(255, 71, 164, 240);
  Color col1_1 = const Color.fromARGB(255, 151, 230, 154);
  Color col2_2 = const Color.fromARGB(255, 216, 130, 124);
  Color col3_3 = const Color.fromARGB(255, 126, 177, 219);
  Color defulatCol = Colors.white;
  Color defulatCol1 = Colors.white;
  Color defulatCo2 = Colors.white;
  Color defulatCo3 = Colors.white;

  CheckRooms() async {
    CollectionReference user = FirebaseFirestore.instance.collection('rooms');
    user.snapshots().listen((event) {
      event.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        setState(() {
          if (data['name'] == 'Orthopedic') {
            id1 = data['Id'];
            if (id1 == 1) {
              defulatestate = state1;
              defulatCol = co1;
              statecolorColor1 = col1_1;
            }
            if (id1 == 2) {
              defulatestate = state2;
              defulatCol = co2;
              statecolorColor1 = col2_2;
            }
            if (id1 == 3) {
              defulatestate = state3;
              defulatCol = co3;
              statecolorColor1 = col3_3;
            }
            print('11======================================');

            print(id1);
            print('111======================================');
          }
          if (data['name'] == 'Vascular') {
            id2 = data['Id'];
            if (id2 == 1) {
              defulatestate1 = state1;
              defulatCol1 = co1;
              statecolorColor2 = col1_1;
            }
            if (id2 == 2) {
              defulatestate1 = state2;
              defulatCol1 = co2;
              statecolorColor2 = col2_2;
            }
            if (id2 == 3) {
              defulatestate1 = state3;
              defulatCol1 = co3;
              statecolorColor2 = col3_3;
            }
            print('22======================================');

            print(id2);
            print('22======================================');
          }
          if (data['name'] == 'Ophthalmic') {
            id3 = data['Id'];
            if (id3 == 1) {
              defulatestate2 = state1;
              defulatCo2 = co1;
              statecolorColor3 = col1_1;
            }
            if (id3 == 2) {
              defulatestate2 = state2;
              defulatCo2 = co2;
              statecolorColor3 = col2_2;
            }
            if (id3 == 3) {
              defulatestate2 = state3;
              defulatCo2 = co3;
              statecolorColor3 = col3_3;
            }
            print('33======================================');

            print(id3);
            print('33======================================');
          }
          if (data['name'] == 'Neurosurgery') {
            id4 = data['Id'];
            if (id4 == 1) {
              defulatestate3 = state1;
              defulatCo3 = co1;
              statecolorColor4 = col1_1;
            }
            if (id4 == 2) {
              defulatestate3 = state2;
              defulatCo3 = co2;
              statecolorColor4 = col2_2;
            }
            if (id4 == 3) {
              defulatestate3 = state3;
              defulatCo3 = co3;
              statecolorColor4 = col3_3;
            }
            print('44======================================');

            print(id4);
            print('44======================================');
          }
        });
      });
    });
  }

  var defulatestate = '';
  var defulatestate1 = '';
  var defulatestate2 = '';
  var defulatestate3 = '';
  var state1 = '  Operating Room is Empty  ';
  var state2 = '   Operating Room is Busy   ';
  var state3 = ' Operating Room is Booked ';

  TextStyle styles = const TextStyle(
      fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);
  TextStyle styleState = const TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 2, 64, 66));
  TextStyle styleState1 =
      const TextStyle(fontSize: 20, color: Color.fromARGB(255, 25, 73, 99));
  @override
  void initState() {
    CheckRooms();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("rooms states",
            style: TextStyle(color: Colors.black, fontSize: 25)),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                  elevation: 10,
                  shadowColor: Colors.amber,
                  color: Colors.blue[100],
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Image.asset(
                        'assets/test.jpg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Orthopedic operating room',
                        style: styles,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Room State',
                        style: styleState1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: defulatCol,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Card(
                            color: statecolorColor1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Text(
                                    '${defulatestate}',
                                    style: styleState,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Card(
                  elevation: 10,
                  shadowColor: Colors.amber,
                  color: Colors.blue[100],
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Image.asset(
                        'assets/test1.jpg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Vascular operating room',
                        style: styles,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Room State',
                        style: styleState1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: defulatCol1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Card(
                            color: statecolorColor2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Text(
                                    '${defulatestate1}',
                                    style: styleState,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Card(
                  elevation: 10,
                  shadowColor: Colors.amber,
                  color: Colors.blue[100],
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Image.asset(
                        'assets/test2.jpg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Ophthalmic operating room',
                        style: styles,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Room State',
                        style: styleState1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: defulatCo2,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Card(
                            color: statecolorColor3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Text(
                                    '${defulatestate2}',
                                    style: styleState,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Card(
                  elevation: 10,
                  shadowColor: Colors.amber,
                  color: Colors.blue[100],
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Image.asset(
                        'assets/test3.jpg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Neurosurgery operating room',
                        style: styles,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Room State',
                        style: styleState1,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: defulatCo3,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Card(
                            color: statecolorColor4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Text(
                                    '${defulatestate3}',
                                    style: styleState,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
