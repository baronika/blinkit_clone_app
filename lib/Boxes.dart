import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleBox(),
                SingleBox(),
                SingleBox(),
                SizedBox(height: 50,),
              ]
          ),
        ],
      ),
      ),
    );
  }
}

class SingleBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(Icons.shopping_basket_outlined),

    );
  }
}