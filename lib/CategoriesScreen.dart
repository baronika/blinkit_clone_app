import 'package:blinkit_clone_app/Grids.dart';
import 'package:blinkit_clone_app/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SearchAppBar.dart';

class CategoriesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _CategoriesScreenState();

}

class _CategoriesScreenState extends State<CategoriesScreen>{
  final PageController pageController =PageController(initialPage: 0);

    @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Grocery & Kichen",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Grids()
                ],
              ),
            ),
          ),

          SizedBox(
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Snacks and Drinks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Grids()
                ],
              ),
            ),
          ),

          SizedBox(
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Household Essentials",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Grids()
                ],
              ),
            ),
          ),

          SizedBox(
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Shop by Store",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Grids()
                ],
              ),
            ),
          ),

          SizedBox(
            child: Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("India's last minute app 🧡️",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.black38,
                      fontSize: 50,
                    ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  void _onProfileTap() {
      Navigator.pushNamed(context, AppRoutes.profile);
  }
}