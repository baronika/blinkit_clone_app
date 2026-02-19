import 'package:blinkit_clone_app/CategoriesScreen.dart';
import 'package:blinkit_clone_app/HomeScreen.dart';
import 'package:blinkit_clone_app/OrderAgainScreen.dart';
import 'package:blinkit_clone_app/PrintScreen.dart';
import 'package:blinkit_clone_app/ProfileScreen.dart';
import 'package:blinkit_clone_app/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SearchAppBar.dart';

class BottomNavBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{
  int currIndex=0;
  final List<Widget> pages=[
    HomeScreen(),
    OrderAgainScreen(),
    CategoriesScreen(),
    PrintScreen(),
    ProfileScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currIndex!= 4? SearchAppBar(
        // hintText: "Search Items...",
        onChanged: (value){
          print("Searching $value");
        },
        onProfileTap: (){
          Navigator.pushNamed(context, AppRoutes.profile);
        },
      ): null,
      body: IndexedStack(
        index: currIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currIndex,
          onTap: (index)=>
          setState(() => currIndex=index),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded), label:'Order Again'),
            BottomNavigationBarItem(icon: Icon(Icons.space_dashboard_rounded),label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.print_rounded),label: 'Print'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: 'Profile'),
          ],
      ),
    );
  }
}