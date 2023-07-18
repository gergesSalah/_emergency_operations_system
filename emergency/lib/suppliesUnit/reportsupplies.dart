import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class reportsupplies extends StatefulWidget {
  @override
  reportsuppliesState createState() => reportsuppliesState();
}

class reportsuppliesState extends State<reportsupplies> {
  CollectionReference medicalSupplyStoreref =
      FirebaseFirestore.instance.collection("medicalsupplyStore");
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
          title: const Text("Medical Supplies",
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

// FutureBuilder(
//         future: medicalSupplyStoreref.get(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, i) {
//                 // item = snapshot.data!.docs;
//                 return Text("${snapshot.data!.docs.data()['Name']}");
//               },
//             );
//           }
//           if (snapshot.hasError) {
//             return Text("error");
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),

// supplies.isEmpty || supplies == null
//           ? Text("loading")
//           : Center(
//               child: Card(
//                 elevation: 50,
//                 shadowColor: Colors.blue,

//                 // semanticContainer: false,
//                 // borderOnForeground: false,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     side: const BorderSide(
//                         color: Colors.white,
//                         width: 3,
//                         style: BorderStyle.solid)),

//                 //   color: Colors.amber,

//                 margin: const EdgeInsets.all(10),

//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15.0, top: 15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Text(
//                                 "Name",
//                                 style: TextStyle(fontSize: 20.5),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               gradient: LinearGradient(
//                                   colors: [Colors.pink, Colors.red],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.red,
//                                   blurRadius: 12,
//                                   offset: Offset(0, 6),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 8),
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Text(
//                                 "code",
//                                 style: TextStyle(fontSize: 20.5),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               gradient: LinearGradient(
//                                   colors: [Colors.cyan, Colors.blue],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.blueAccent,
//                                   blurRadius: 12,
//                                   offset: Offset(0, 6),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 8),
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Text(
//                                 "count",
//                                 style: TextStyle(fontSize: 20.5),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               gradient: LinearGradient(
//                                   colors: [Colors.amber, Colors.orange],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.deepOrangeAccent,
//                                   blurRadius: 12,
//                                   offset: Offset(0, 6),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 100,
//                             margin: EdgeInsets.only(left: 8),
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Text(
//                                 "details",
//                                 style: TextStyle(fontSize: 20.5),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               gradient: LinearGradient(
//                                   colors: [
//                                     Colors.greenAccent,
//                                     Color.fromARGB(255, 24, 122, 27)
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.green,
//                                   blurRadius: 12,
//                                   offset: Offset(0, 6),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15.0, top: 15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 67,
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Text(
//                                 "adomina",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: Colors.red[100],
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 5),
//                             width: 60,
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Text(
//                                 "CD",
//                                 style: TextStyle(
//                                     fontSize: 25, color: Colors.blue[100]),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 5),
//                             width: 66,
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Text(
//                                 "856",
//                                 style: TextStyle(
//                                     fontSize: 25, color: Colors.orange[100]),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                 color: Colors.orange,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 5),
//                             width: 100,
//                             child: Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     "details is here we can do every thing we want to do if we have the god statisfy ",
//                                     style: TextStyle(
//                                         fontSize: 12, color: Colors.green[100]),
//                                     textAlign: TextAlign.start,
//                                   ),
//                                   Text(
//                                     "the recorded Date :",
//                                     style: TextStyle(
//                                         fontSize: 10, color: Colors.green[100]),
//                                     textAlign: TextAlign.start,
//                                   ),
//                                   Text(
//                                     "20/5/2000",
//                                     style: TextStyle(
//                                         fontSize: 14, color: Colors.green[200]),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ListView.builder(
//                         itemCount: supplies.length,
//                         itemBuilder: (context, i) {
//                           return ListTile(
//                             title: Text("${supplies[i]['Name']}"),
//                             subtitle:
//                                 Text("quantity : ${supplies[i]['quantity']}"),
//                           );
//                         }),
//                   ],
//                 ),
//               ),
//             ),

// ListView.builder(
//             itemCount: supplies.length,
//             itemBuilder: (context, i) {
//               return ListTile(
//                 title: Text("${supplies[i]['Name']}"),
//                 subtitle: Text("quantity : ${supplies[i]['quantity']}"),
//               );
//             }));

// Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(_borderRadius),
//             gradient: LinearGradient(
//                 colors: [Colors.pink, Colors.red],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.red,
//                 blurRadius: 12,
//                 offset: Offset(0, 6),
//               )
//             ],
//           ),
//         ),
//         CustomPaint(
//           painter: customCardPainter(),
//         )
//       ],
//     ),
//   ),
// ),

//
//
//
// class customCardPainter extends CustomPainter {
//   final double radius;

//   @override
//   void paint(Canvas canvas, Size size) {
//     var raduis = 24.0;

//     var paint = Paint();
//     paint.shader = ui.Gradient.linear(
//       Offset(0,0),Offset(size.width, size.height),[
//         HSLColor.fromColor(startColor).withLightness(0.8).toColor(),

//       ]
//     )
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     throw UnimplementedError();
//   }
// }

new_element({required String title, required IconData icon, onclick}) {
  const color = Colors.white;
  const hovercolor = Colors.white70;
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(color: color, fontSize: 18),
    ),
    leading: Icon(
      icon,
      color: color,
      size: 30,
    ),
    onTap: onclick,
  );
}

move_to_page(BuildContext ctx, index) {
  Navigator.of(ctx).pop();
  switch (index) {
    case 0:
      () {};
      break;
    case 1:
      Navigator.of(ctx)
          .push(MaterialPageRoute(builder: (_) => reportsupplies()));
      break;
    case 2:
      () {};
      break;
  }
}

Drawer_add(BuildContext ctx) {
  return Material(
    color: Colors.blue,
    child: ListView(
      children: [
        const SizedBox(height: 10),
        headDrawer(),
        const SizedBox(height: 20),
        const Divider(
            color: Colors.white, thickness: 2, indent: 10, endIndent: 10),
        const SizedBox(height: 30),
        searchFiled(),
        const SizedBox(height: 10),
        search_button(),
        const SizedBox(height: 20),
        new_element(
            title: ' Reports of Medicines',
            icon: Icons.medication_liquid,
            onclick: () => move_to_page(ctx, 1)),
        const SizedBox(height: 20),
        new_element(
            title: ' Add New Medicine',
            icon: Icons.add,
            onclick: () => move_to_page(ctx, 2)),
      ],
    ),
  );
}

searchFiled() {
  return TextField(
    decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.5),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            )),
        hintText: 'Search For Medicine',
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          Icons.search,
          size: 30,
        ),
        prefixIconColor: Colors.white,
        labelText: 'Medicine',
        labelStyle: TextStyle(color: Colors.white)),
  );
}

headDrawer() {
  return Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.blue,
      //  image:DecorationImage(image: AssetImage('assets/Medicine.jpg')) ,
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          'assets/Medicine.jpg',
        ),
      ),
    ),
    child: Column(children: const [Text(' ')]),
    // child: Column(
    //   children: [
    //     Image.asset(
    //   'assets/Medicine.jpg',
    //   fit: BoxFit.cover,
    // ),
  );
}

search_button() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 38, 129, 174),
          padding: EdgeInsets.all(15)),
      onPressed: () {},
      child: const Text('Search'),
    ),
  );
}
