import 'dart:io';

import 'package:flutter/material.dart';

// void main(List<String> args) => runApp(myApp());

// class myApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: "test",
//       home: myAppstateful(),
//     );
//   }
// }

class myAppstateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return myAppstatefulState();
  }
}

class myAppstatefulState extends State<myAppstateful> {
  // void selectScreen(BuildContext ctx, int n) {
  //   Navigator.of(ctx).push(MaterialPageRoute(
  //     builder: (_) {
  //       if (n == 1)
  //         return supplies();
  //       // else if(n==2) return admin();
  //       else if (n == 3) return addSheet();
  //       return pharmcy();
  //     },
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("test ",
            style: TextStyle(color: Colors.purple, fontSize: 35)),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              for (int i = 0; i <= 5; i++) {
                Container(
                  color: Colors.amber,
                  child: Text("hallo"),
                  margin: EdgeInsets.all(10),
                );
              }
            });
          },
          child: Text("test"),
        ),
      ),
    );
  }
}
