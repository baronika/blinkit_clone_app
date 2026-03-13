import 'package:blinkit_clone_app/components/Boxes.dart';
import 'package:blinkit_clone_app/components/Filter.dart';
import 'package:blinkit_clone_app/components/Grids.dart';
import 'package:blinkit_clone_app/components/Grids3.dart';
import 'package:blinkit_clone_app/components/SearchAppBar.dart';
import 'package:blinkit_clone_app/components/bottom_sheet_filter.dart';
import 'package:blinkit_clone_app/components/category_items_grid.dart';
import 'package:blinkit_clone_app/components/custom_app_bar.dart';
import 'package:blinkit_clone_app/components/list_categories.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/services/db/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/address_bottom_sheet.dart';

class CategoryScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController categoryController=TextEditingController();
  String? selectedAddress;
  String selectedCategory="Beauty";

  final FirestoreService firestoreService=FirestoreService();

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
          child: CustomAppBar(
            title: "Category",
            address: "Industrial Area, Sector 74",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(width: 75, child: ListCategories(
              onCategoryTap: (category){
                setState(() {
                  selectedCategory=category;
                });
              },)),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    child: SizedBox(
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
                    onTap: ()=>{ BottomSheetFilter.show(context)},
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                      child: CategoryItemsGrid(category: selectedCategory),
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
