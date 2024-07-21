import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void create() async {
    try {
      await firestore.collection('Mobile Dev').doc('students').set({
        'firstName': 'Sammy',
        'lastName': 'Doe',
      });
    } catch (e) {
      print(e);
    }
  }



  void read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await firestore.collection('Mobile Dev').doc('students').get();
      Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
      print(data.toString());
    } catch (e) {
      print(e);
    }
  }


  void update() async {
    try {
      firestore.collection('Mobile Dev').doc('students').update({
        'firstName': 'Christine',
      });
    } catch (e) {
      print(e);
    }
  }

  void delete() async {
    try {
      firestore.collection('Mobile Dev').doc('students').delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase CRUD Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ElevatedButton(
            onPressed: (){
              create();
            },
            child: const Text("Create"),
            
          ),
          ElevatedButton(
            onPressed: (){
              read();
            },
            child: const Text("Read"),
            
          ),
          ElevatedButton(
            onPressed: (){
              update();
            },
            child: const Text("Update"),
            
          ),
          ElevatedButton(
            onPressed: (){
              delete();
            },
            child: const Text("Delete"),
          ),
        ]),
      ),
    );
  }
}