import 'package:blinkit_clone_app/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grids3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _Grids3();

}

class _Grids3 extends State<Grids3>{
  final List<Map<String,String>> items=[
    {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    {"image": "assets/icons/67419100_9662747.png", "text": "Plus"},
    {"image": "assets/icons/67419100_9662747.png","text": "Eighteen"},
    {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    {"image": "assets/icons/67419100_9662747.png","text": "Plus"},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
          childAspectRatio: 0.58
        ),
        itemBuilder: (context,index){
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 90,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              items[index]["image"]!,
                            ),



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
                                    child: Text("Print",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green
                                      ),)),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite_border_outlined,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
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
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}