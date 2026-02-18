import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreen();

}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          Text("Recent Searches",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
          ],
        ),
      ),
    );
  }
}