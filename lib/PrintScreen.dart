import 'package:blinkit_clone_app/Boxes.dart';
import 'package:blinkit_clone_app/Grids3.dart';
import 'package:blinkit_clone_app/PrintGrids.dart';
import 'package:blinkit_clone_app/ScrollableList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrintScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrintScreen();
}

class _PrintScreen extends State<PrintScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFF6F2E5)),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Print Store",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Blinkit ensures secure prints at every stage",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 30),
              Container(
                height: 220,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Documents",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "✦ Price starting at Rs.3/page",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "✦ Paper Quality: 70 GSM",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "✦ Single side prints",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightGreen,
                        ),
                        child: GestureDetector(
                          onTap: () => {},
                          child: Text(
                            "Upload Files",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Prints",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.all(20),
              child:PrintGrids(),),
              SizedBox(
                child: Padding(padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("India's last minute app️",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.black26,
                          fontSize: 50,
                        ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
