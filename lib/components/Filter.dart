import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box1 extends StatelessWidget{
    final String title;
    final IconData icon;

  const Box1({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8,),
          Text(title),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

}