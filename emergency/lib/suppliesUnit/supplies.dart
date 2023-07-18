import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency/suppliesUnit/addSupply/inStore.dart';
import 'package:emergency/suppliesUnit/addSupply/inSuppliesUnit.dart';
import 'package:flutter/material.dart';
import '../login/login.dart';
import '../pharmcy/reportSuppliesunit.dart';
import 'reportsupplies.dart';

class supplies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: SuppliesPage(),
    );
  }
}

class SuppliesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SuppliesState();
}

class SuppliesState extends State<SuppliesPage> {
  Map<String, dynamic>? data;
  getDateFilter(name) async {
    CollectionReference userf = FirebaseFirestore.instance.collection('users');
    await userf.where('Name', isEqualTo: name).get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          data = element.data() as Map<String, dynamic>;
        });
        print(data);
        print("===============================");
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
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
        title: const Text("supplies",
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
      drawer: Drawer(
        child: Drawer_add(context),
      ),
    );
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
          .push(MaterialPageRoute(builder: (_) => reportsupplies()));
      break;
    case 2:
      Navigator.of(ctx).push(
          MaterialPageRoute(builder: (_) => addsuppliesInStoreStatefull()));
      break;
    case 3:
      Navigator.of(ctx).push(MaterialPageRoute(
          builder: (_) => supaddsuppliesInSuppliesUnitStatefullply()));
      break;
    case 4:
      Navigator.of(ctx)
          .push(MaterialPageRoute(builder: (_) => reportSuppliesunit()));
      break;
  }
}

Drawer_add(BuildContext ctx) {
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
        searchFiled(),
        const SizedBox(height: 10),
        search_button(),
        const SizedBox(height: 20),
        new_element(
            title: 'Medical Supplies store',
            icon: Icons.report,
            onclick: () => move_to_page(ctx, 1)),
        const SizedBox(height: 20),
        new_element(
            title: 'drug shelves unit',
            icon: Icons.report,
            onclick: () => move_to_page(ctx, 4)),
        const SizedBox(height: 20),
        new_element(
            title: 'Add New Medical Supply in store',
            icon: Icons.add,
            onclick: () => move_to_page(ctx, 2)),
        const SizedBox(height: 20),
        new_element(
            title: 'Add New Medical Supply in drug shelves unit',
            icon: Icons.add,
            onclick: () => move_to_page(ctx, 3)),
      ],
    ),
  );
}

searchFiled() {
  return TextField(
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
      labelText: 'Medical Supplies',
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
          'assets/supplie.jpg',
        ),
      ),
    ),
    child: Column(children: const [Text(' ')]),
  );
}

search_button() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
      onPressed: () {},
      child: const Text('Search'),
    ),
  );
}
