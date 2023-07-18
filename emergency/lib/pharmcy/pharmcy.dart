// import 'package:emergency/addMedicine/inStore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency/pharmcy/addMedicine/inSuppliesUnit.dart';
import 'package:emergency/pharmcy/reportSuppliesunit.dart';
import 'package:flutter/material.dart';
import '../login/login.dart';
import 'addMedicine/inStore.dart';
import 'reportmedicine.dart';

class pharmcy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: PharmcyPage(),
    );
  }
}

class PharmcyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PharmcyState();
}

class PharmcyState extends State<PharmcyPage> {
  TextStyle text = TextStyle(
    fontSize: 20,
  );
  List dataStore = [];

  // medicalsupplyStore
  TextEditingController search = TextEditingController();
  CollectionReference userf =
      FirebaseFirestore.instance.collection('medicalsupplyUnit');
  CollectionReference user2 =
      FirebaseFirestore.instance.collection('medicineStore');
  CollectionReference user3 =
      FirebaseFirestore.instance.collection('medicalsupplyStore');
  getDateFilter() async {
    List list = [user2, userf];
    dataStore.clear();

    print('--------------------------------------------------------');

    await user2.where('Name', isEqualTo: search.text).get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          dataStore.add(element.data());
        });
        print("===============================");

        print('Material in Store');
        print(dataStore);

        print("===============================");
        print(element);
        print("===============================");
      });
    });

    await userf.where('Name', isEqualTo: search.text).get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          dataStore.add(element.data());
        });
        print("===============================");
        print('Material in Unit');
        print(dataStore);

        print("===============================");
        print(element);
        print("===============================");
      });
    });

    await user3.where('Name', isEqualTo: search.text).get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          dataStore.add(element.data());
        });
        print("===============================");
        print('Material in Unit');
        print(dataStore);

        print("===============================");
        print(element);
        print("===============================");
      });
    });
  }

  @override
  void initState() {}
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => login()));
                },
                icon: Icon(Icons.keyboard_return_rounded))
          ],
          title: const Text("pharmacy",
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
            itemCount: dataStore.length,
            itemBuilder: (context, i) {
              return Center(
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.blue,

                  // semanticContainer: false,
                  // borderOnForeground: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                          color: Colors.white,
                          width: 3,
                          style: BorderStyle.solid)),

                  //   color: Colors.amber,

                  margin: const EdgeInsets.all(10),

                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        i == 0
                            ? Text(
                                'Mdicine in Store',
                                style: text,
                              )
                            : Text('Medicine in supply unit', style: text),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: const Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Name",
                                    style: TextStyle(fontSize: 20.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  gradient: const LinearGradient(
                                      colors: [Colors.pink, Colors.red],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.red,
                                      blurRadius: 12,
                                      offset: Offset(0, 6),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "code",
                                    style: TextStyle(fontSize: 20.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  gradient: const LinearGradient(
                                      colors: [Colors.cyan, Colors.blue],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.blueAccent,
                                      blurRadius: 12,
                                      offset: Offset(0, 6),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: const Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "count",
                                    style: TextStyle(fontSize: 20.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  gradient: const LinearGradient(
                                      colors: [Colors.amber, Colors.orange],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: const [
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
                                margin: const EdgeInsets.only(left: 8),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "details",
                                    style: TextStyle(fontSize: 20.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Colors.greenAccent,
                                        Color.fromARGB(255, 24, 122, 27)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  boxShadow: const [
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
                                    "${dataStore[i]['Name']}",
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
                                margin: const EdgeInsets.only(left: 5),
                                width: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${dataStore[i]['quantity']}",
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
                                margin: const EdgeInsets.only(left: 5),
                                width: 66,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${dataStore[i]['code']}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.orange[100]),
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
                                margin: const EdgeInsets.only(left: 5),
                                width: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${dataStore[i]['details']}",
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
                                        "${dataStore[i]['Date']}",
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
            }),
        drawer: Drawer(
          // backgroundColor: Colors.blue,
          child: Drawer_add(context, search, getDateFilter),
        ));
  }
}

new_element({required String title, required IconData icon, onclick}) {
  const color = Color.fromARGB(255, 120, 30, 136);
  const hovercolor = Colors.blue;
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
          .push(MaterialPageRoute(builder: (_) => reportmedicine()));
      break;
    case 2:
      Navigator.of(ctx).push(
          MaterialPageRoute(builder: (_) => addMedicinInStoreStatefull()));
      break;
    case 3:
      Navigator.of(ctx).push(
          MaterialPageRoute(builder: (_) => addMedicinInsuppliesStatefull()));
      break;
    case 4:
      Navigator.of(ctx)
          .push(MaterialPageRoute(builder: (_) => reportSuppliesunit()));
      break;
  }
}

Drawer_add(BuildContext ctx, search, getDateFilter) {
  return Material(
    //  color: Colors.grey,
    child: ListView(
      children: [
        const SizedBox(height: 10),
        headDrawer(),
        const SizedBox(height: 20),
        const Divider(
            color: Colors.white, thickness: 2, indent: 10, endIndent: 10),
        const SizedBox(height: 30),
        searchFiled(search),
        const SizedBox(height: 10),
        search_button(getDateFilter, search),
        const SizedBox(height: 20),
        new_element(
            title: 'Medicines store',
            icon: Icons.report,
            onclick: () => move_to_page(ctx, 1)),
        const SizedBox(height: 20),
        new_element(
            title: 'drug shelves unit',
            icon: Icons.report,
            onclick: () => move_to_page(ctx, 4)),
        const SizedBox(height: 20),
        new_element(
            title: ' Add New Medicine in store',
            icon: Icons.add,
            onclick: () => move_to_page(ctx, 2)),
        const SizedBox(height: 20),
        new_element(
            title: ' Add New Medicine in supplies unit',
            icon: Icons.add,
            onclick: () => move_to_page(ctx, 3)),
      ],
    ),
  );
}

searchFiled(search) {
  return TextField(
    controller: search,
    decoration: InputDecoration(
      fillColor: Color.fromARGB(255, 253, 205, 205).withOpacity(0.5),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          )),
      hintText: 'Search For Medicine',
      // hintStyle: TextStyle(color: Colors.white) ,
      prefixIcon: Icon(
        Icons.search,
        size: 30,
      ),
      // prefixIconColor: Colors.white,
      labelText: 'Supplies',
      // labelStyle: TextStyle(color: Colors.white)
    ),
  );
}

headDrawer() {
  return Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      // color:Colors.blue ,
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
  );
}

search_button(getDateFilter, search) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
      onPressed: getDateFilter,
      child: const Text('Search'),
    ),
  );
}
