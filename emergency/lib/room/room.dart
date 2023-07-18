import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emergency/admin.dart';

import 'package:flutter/material.dart';

import '../admin/admin.dart';

class Room extends StatelessWidget {
  const Room({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RoomState());
  }
}

class RoomState extends StatefulWidget {
  const RoomState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RoomStatePage();
}

class RoomStatePage extends State<RoomState> {
  int room1 = 0;
  int room2 = 0;
  int room3 = 0;
  int room4 = 0;
  Color colors = Colors.blue;
  Color colors2 = Colors.blue;
  Color colors3 = Colors.blue;
  Color colors4 = Colors.blue;
  Color col1 = Color.fromARGB(255, 151, 230, 154);
  Color col2 = Color.fromARGB(255, 216, 130, 124);
  Color col3 = Color.fromARGB(255, 126, 177, 219);
  SubmitDate(idroom, id, name) {
    return ElevatedButton(
      onPressed: () async {
        CollectionReference user =
            FirebaseFirestore.instance.collection('rooms');
        if (id == 0) {
          print('==========================');
          print('Not excute this Function');
        } else {
          await user.doc(idroom).set({'Id': id, 'name': name});
          print('==========================');
          print('excute this Function');
        }
      },
      child: const Text('Update Rooms'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 13, 69, 97)),
      ),
    );
  }

  RidoCheckRoom(value, title, colortitle) {
    return ListTile(
      title: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: colortitle,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      leading: Radio(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        value: value as int,
        groupValue: room1,
        activeColor: colors,
        onChanged: (value) {
          setState(() {
            room1 = value as int;
            if (value == 1) {
              colors = Colors.green;
            }
            if (value == 2) {
              colors = Colors.red;
            }
            if (value == 3) {
              colors = Colors.blue;
            }
          });
        },
      ),
    );
  }

  RidoCheckRoom2(value, title, colortitle) {
    return ListTile(
      title: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: colortitle,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      leading: Radio(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        value: value as int,
        groupValue: room2,
        activeColor: colors2,
        onChanged: (value) {
          setState(() {
            room2 = value as int;
            if (value == 1) {
              colors2 = Colors.green;
            }
            if (value == 2) {
              colors2 = Colors.red;
            }
            if (value == 3) {
              colors2 = Colors.blue;
            }
          });
        },
      ),
    );
  }

  RidoCheckRoom3(value, title, colortitle) {
    return ListTile(
      title: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: colortitle,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      leading: Radio(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        value: value as int,
        groupValue: room3,
        activeColor: colors3,
        onChanged: (value) {
          setState(() {
            room3 = value as int;
            if (value == 1) {
              colors3 = Colors.green;
            }
            if (value == 2) {
              colors3 = Colors.red;
            }
            if (value == 3) {
              colors3 = Colors.blue;
            }
          });
        },
      ),
    );
  }

  RidoCheckRoom4(value, title, colortitle) {
    return ListTile(
      title: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: colortitle,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      leading: Radio(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        value: value as int,
        groupValue: room4,
        activeColor: colors4,
        onChanged: (value) {
          setState(() {
            room4 = value as int;
            if (value == 1) {
              colors4 = Colors.green;
            }
            if (value == 2) {
              colors4 = Colors.red;
            }
            if (value == 3) {
              colors4 = Colors.blue;
            }
          });
        },
      ),
    );
  }

  @override
  TextStyle styles = const TextStyle(
      fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("  Operating Rooms",
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
          child: Column(children: [
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
                    const SizedBox(height: 10),
                    RidoCheckRoom(
                      1,
                      'operating room is empty',
                      col1,
                    ),
                    RidoCheckRoom(
                      2,
                      'operating room is busy',
                      col2,
                    ),
                    RidoCheckRoom(
                      3,
                      'operating room is booked',
                      col3,
                    ),
                    SubmitDate('1', room1, 'Orthopedic'),
                    const SizedBox(height: 10),
                  ],
                )),
            const SizedBox(
              height: 8,
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
                    const SizedBox(height: 10),
                    RidoCheckRoom2(
                      1,
                      'operating room is empty',
                      col1,
                    ),
                    RidoCheckRoom2(
                      2,
                      'operating room is busy',
                      col2,
                    ),
                    RidoCheckRoom2(
                      3,
                      'operating room is booked',
                      col3,
                    ),
                    SubmitDate('2', room2, 'Vascular'),
                    const SizedBox(height: 10),
                  ],
                )),
            const SizedBox(
              height: 8,
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
                    const SizedBox(height: 10),
                    RidoCheckRoom3(
                      1,
                      'operating room is empty',
                      col1,
                    ),
                    RidoCheckRoom3(
                      2,
                      'operating room is busy',
                      col2,
                    ),
                    RidoCheckRoom3(
                      3,
                      'operating room is booked',
                      col3,
                    ),
                    SubmitDate('3', room3, 'Ophthalmic'),
                    const SizedBox(height: 10),
                  ],
                )),
            const SizedBox(
              height: 8,
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
                      'Neurosurgery operating room ',
                      style: styles,
                    ),
                    const SizedBox(height: 10),
                    RidoCheckRoom4(
                      1,
                      'operating room is empty',
                      col1,
                    ),
                    RidoCheckRoom4(
                      2,
                      'operating room is busy',
                      col2,
                    ),
                    RidoCheckRoom4(
                      3,
                      'operating room is booked',
                      col3,
                    ),
                    SubmitDate('4', room4, 'Neurosurgery'),
                    const SizedBox(height: 10),
                  ],
                )),
            const SizedBox(
              height: 8,
            ),
          ]),
        ),
      ),
    );
  }
}
