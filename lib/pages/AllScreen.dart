import 'package:blinkit_clone_app/components/FeaturedGrid.dart';
import 'package:blinkit_clone_app/components/Grids.dart';
import 'package:blinkit_clone_app/components/ScrollableList.dart';
import 'package:blinkit_clone_app/components/FrequentlyBoughtGrids.dart';
import 'package:blinkit_clone_app/components/see_more_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Text("Featured",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "serif",
                    color: Colors.brown
                  ),
                  ),
                  Text("DESCRIPTION",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown
                      ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                      child: FeaturedGrid()
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),

            Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Picks",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ScrollableList(),
                    SizedBox(height: 10,),
                    SeeMoreOptions(),
                    SizedBox(height: 20,),
                    Text(
                      "Frequently bought",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    FrequentlyBoughtGrids(),
                  ],
                ),
              ),
            )
          ],
        )

      ),
    );
  }
}