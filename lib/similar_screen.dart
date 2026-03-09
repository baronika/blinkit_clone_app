import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/Filter.dart';
import 'components/category_items_grid.dart';
import 'components/custom_app_bar.dart';
import 'components/list_categories.dart';

class SimilarScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SimilarScreenState();
}

class _SimilarScreenState extends State<SimilarScreen>{
  List<Map<String, dynamic>> filterOptions = [
    {"title": "Filter", "icon": Icons.tune},
    {"title": "Sort", "icon": Icons.swap_vert},
    {"title": "Quantity", "icon": Icons.add},
    {"title": "Price", "icon": Icons.tag},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Expanded(
              child:  CustomAppBar(title: "Similar", address: "Industrial Area, Sector 74",))
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(width: 60, child: ListCategories()),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filterOptions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: Box1(
                            title: filterOptions[index]["title"],
                            icon: filterOptions[index]["icon"],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CategoryItemsGrid(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}