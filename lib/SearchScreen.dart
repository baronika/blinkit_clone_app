import 'package:blinkit_clone_app/components/ScrollableList.dart';
import 'package:blinkit_clone_app/components/SearchBar2.dart';
import 'package:blinkit_clone_app/components/recent_searches.dart';
import 'package:blinkit_clone_app/components/see_more_options.dart';
import 'package:blinkit_clone_app/components/BrowseBoxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'
    hide StaggeredGrid;

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: SearchBar2(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Searches",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "clear",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              RecentSearches(),
              SizedBox(height: 20,),
              Text(
                "Continue browsing for",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              BrowseBoxes(),
              SizedBox(height: 20),

              Text(
                "Top Picks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),
              ScrollableList(),
              SizedBox(height: 10),
              SeeMoreOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
