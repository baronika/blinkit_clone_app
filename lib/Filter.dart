import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 110,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Icon(Icons.tune_rounded),
          SizedBox(width: 8,),
          Text("Filter"),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

}