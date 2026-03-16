import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Test extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_TestState();

}

class _TestState extends State<Test>{
  @override
  void initState() {
    super.initState();
    addTestData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Test")),
      body: const Center(
        child: Text("Check Firestore Console"),
      ),
    );  }
}
void addTestData() async {
  await FirebaseFirestore.instance.collection("test").add(
    {
      "name":"Blinkit  Clone",
      "status":"Connected",
      "time":DateTime.now()
    }
  );
}

