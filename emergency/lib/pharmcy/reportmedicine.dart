import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class reportmedicine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return reportmedicineState();
  }
}

class reportmedicineState extends State<reportmedicine> {
  CollectionReference medicalSupplyStoreref =
      FirebaseFirestore.instance.collection("medicineStore");
  List supplies = [];

  getData() async {
    var responsebody = await medicalSupplyStoreref.get();
    responsebody.docs.forEach((element) {
      setState(() {
        supplies.add(element.data());
      });
    });
    print(
        "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print(supplies);
    print(
        "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  // final List li = [
  //   String l1 = supplies[0];

  // ];

  var item;
  final double _borderRadius = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("medicines",
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
        body: ListView.builder(
          itemCount: supplies.length,
          itemBuilder: (context, i) {
            return Center(
              child: Card(
                elevation: 50,
                shadowColor: Colors.blue,
                color: Colors.grey[700],
                // semanticContainer: false,
                // borderOnForeground: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: Colors.blue,
                        width: 3,
                        style: BorderStyle.solid)),

                //   color: Colors.amber,

                margin: const EdgeInsets.all(10),

                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Name",
                                  style: TextStyle(fontSize: 20.5),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                gradient: LinearGradient(
                                    colors: [Colors.pink, Colors.red],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red,
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "code",
                                  style: TextStyle(fontSize: 20.5),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                gradient: LinearGradient(
                                    colors: [Colors.cyan, Colors.blue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueAccent,
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "count",
                                  style: TextStyle(fontSize: 20.5),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                gradient: LinearGradient(
                                    colors: [Colors.amber, Colors.orange],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepOrangeAccent,
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(left: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "details",
                                  style: TextStyle(fontSize: 20.5),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.greenAccent,
                                      Color.fromARGB(255, 24, 122, 27)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green,
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 67,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "${supplies[i]['Name']}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[100],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "${supplies[i]['code']}",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.blue[100]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              width: 66,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "${supplies[i]['quantity']}",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.orange[100]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "${supplies[i]['details']}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green[100]),
                                      textAlign: TextAlign.start,
                                    ),
                                    // Text(
                                    //   "the recorded Date :",
                                    //   style: TextStyle(
                                    //       fontSize: 10,
                                    //       color: Colors.green[100]),
                                    //   textAlign: TextAlign.start,
                                    // ),
                                    Text(
                                      "${supplies[i]['Date']}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green[200]),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
