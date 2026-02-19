import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grids extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GridsState();

}

class _GridsState extends State<Grids>{
  final List<Map<String,String>> items=[
    {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    {"image": "assets/icons/67419100_9662747.png", "text": "Plus"},
    {"image": "assets/icons/67419100_9662747.png","text": "Eighteen"},
    {"image": "assets/icons/67419100_9662747.png","text": "Home"},
    {"image": "assets/icons/67419100_9662747.png","text": "Plus"},
    {"image": "assets/icons/67419100_9662747.png","text": "Eighteen"},
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
            color: Color(0xFFE2EEF1),
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  items[index]["image"]!,
                  height: 60,
                ),
                SizedBox(height: 10),
                Text(
                  items[index]["text"]!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        }
    );
  }
}