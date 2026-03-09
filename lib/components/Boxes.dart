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
      width: MediaQuery.of(context).size.width*0.28,
      height: MediaQuery.of(context).size.height*0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(Icons.shopping_basket_outlined),

    );
  }
}