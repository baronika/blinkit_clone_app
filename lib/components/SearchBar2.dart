import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ScrollableList.dart';

class SearchBar2 extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintText: "Search items",
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.search_screen);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}