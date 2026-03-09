import 'package:blinkit_clone_app/components/FrequentlyBoughtGrids.dart';
import 'package:blinkit_clone_app/components/Grids.dart';
import 'package:blinkit_clone_app/components/Grids3.dart';
import 'package:blinkit_clone_app/components/ScrollableList.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      ),
    );
  }
}