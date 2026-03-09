import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentSearches extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  final List<Map<String, String>> recentSearchesList = [
    {"img": "assets/icons/67419100_9662747.png", "title": "Headphones hhk"},
    {"img": "assets/icons/67419100_9662747.png", "title": "Headphone"},
    {"img": "assets/icons/67419100_9662747.png", "title": "Headphone"},
    {"img": "assets/icons/67419100_9662747.png", "title": "Headphone"},
    {"img": "assets/icons/67419100_9662747.png", "title": "Headphone"},
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
          spacing: 6,
          runSpacing: 6,
          children: recentSearchesList.map((item){
            return Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black12
                )
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(item["img"]!,
                  height: 20,
                  width: 20,),
                  const SizedBox(width: 5),
                  Text(item["title"]!)
                ],
              )
            );
          }).toList()
    );
  }
}