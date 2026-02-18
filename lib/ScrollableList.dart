import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_rating_bar.dart';

class ScrollableList extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _ScrollableListState();

}
class _ScrollableListState extends State<ScrollableList>{
  final List<Map<String, String>> items=[
    {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    {"image": "assets/icons/67419100_9662747.png", "text": "Plus"},
    {"image": "assets/icons/67419100_9662747.png","text": "Eighteen"},
    {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    {"image": "assets/icons/67419100_9662747.png", "text": "Plus"},
    {"image": "assets/icons/67419100_9662747.png","text": "Eighteen"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) {
              return SizedBox(
                width: 180,
                  child: Card(
                  elevation: 0,
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 95,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xC0F2F2FA)
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      items[index]["image"]!,),
                                    Container(
                                      height: 35,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.lightGreen,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white
                                      ),
                                      child: Center(
                                        child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text("ADD",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green
                                              ),)),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ]
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        child: Padding(padding: EdgeInsets.all(20),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "200g",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.indigo,
                              ),
                            ),

                            Text(
                              items[index]["text"]!,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            custom_rating_bar(rating: 5),

                            Text(
                              "9 MINS",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),

                            Text(
                              "15% OFF",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              "Rs.50",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0x4DBADC91)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("See more like this",
                                    style: TextStyle(
                                        color: Color(0xFF3D753D),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                    color: Color(0xFF3D753D),
                                    size: 10,)
                                ],
                              )
                            )
                          ],
                        ),
                      ),
                      ),
                    ],
                  ),
                  )
              );
            }
      )
    );
  }

}