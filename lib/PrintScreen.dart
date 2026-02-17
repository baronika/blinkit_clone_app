import 'package:blinkit_clone_app/ScrollableList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrintScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_PrintScreen();

}

class _PrintScreen extends State<PrintScreen>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      children: [
        SizedBox(height: 20,),
        Text(
          "Print Store",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20,),
        Text(
          "Documents",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        ScrollableList(),
      ],
      ),
    );
  }
}