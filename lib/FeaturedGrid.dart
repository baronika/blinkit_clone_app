import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeaturedGrid extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _FeaturedGridState();
}

class _FeaturedGridState extends State<FeaturedGrid>{
  final List<Map<String,String>> items=[
    {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    {"image": "assets/icons/67419100_9662747.png", "text": "Plus"},
    {"image": "assets/icons/67419100_9662747.png","text": "Eighteen"},
    // {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    // {"image": "assets/icons/67419100_9662747.png","text": "Plus"},
    // {"image": "assets/icons/67419100_9662747.png","text": "Eighteen"},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context,index){
          return Card(
            color: Color(0xFFFCFCF3),
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  "Notebooks",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  items[index]["image"]!,
                  height: 60,
                ),

              ],
            ),
          );
        }
    );
  }
}