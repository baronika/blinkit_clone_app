import 'package:blinkit_clone_app/FrequentlyBoughtGrids.dart';
import 'package:blinkit_clone_app/Grids.dart';
import 'package:blinkit_clone_app/Grids3.dart';
import 'package:blinkit_clone_app/ScrollableList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderAgainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_OrderAgainScreen();

}

class _OrderAgainScreen extends State<OrderAgainScreen>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
      
          Text(
            "Frequently bought",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
      
          SizedBox(height: 20),
          FrequentlyBoughtGrids(),
          FrequentlyBoughtGrids(),

          SizedBox(height: 20),

          Text(
            "More than you ordered",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),
          FrequentlyBoughtGrids(),
          FrequentlyBoughtGrids(),

          SizedBox(height: 20),

          Text(
            "Previously bought",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          ScrollableList(),
        ],
      ),
    );
  }
}