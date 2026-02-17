import 'package:blinkit_clone_app/AllScreen.dart';
import 'package:blinkit_clone_app/BeautyScreen.dart';
import 'package:blinkit_clone_app/DecorScreen.dart';
import 'package:blinkit_clone_app/ElectronicsScreen.dart';
import 'package:blinkit_clone_app/SearchAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final PageController pageController =PageController(initialPage: 0);
  int currIndex=0;
  void changePage(int index){
    pageController.jumpToPage(index);
    setState(() {
      currIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            SizedBox(height: 20),

            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: ()=> changePage(0),
                    child: Text(
                      "All",
                      style: TextStyle(
                        fontWeight: currIndex==0? FontWeight.bold: FontWeight.normal
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> changePage(1),
                    child: Text(
                      "Electronics",
                      style: TextStyle(
                        fontWeight: currIndex==1? FontWeight.bold: FontWeight.normal
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> changePage(2),
                    child: Text(
                      "Beauty",
                      style: TextStyle(
                        fontWeight: currIndex==2 ? FontWeight.bold: FontWeight.normal
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> changePage(3),
                    child: Text(
                      "Decor",
                      style: TextStyle(
                          fontWeight: currIndex==3 ? FontWeight.bold: FontWeight.normal
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [
                AllScreen(),
                ElectronicsScreen(),
                BeautyScreen(),
                DecorScreen()
              ],
            ),
            ),

          ],
        ),
      ),
    );
  }
}