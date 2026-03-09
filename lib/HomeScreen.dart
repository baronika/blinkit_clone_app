import 'package:blinkit_clone_app/pages/AllScreen.dart';
import 'package:blinkit_clone_app/pages/BeautyScreen.dart';
import 'package:blinkit_clone_app/pages/DecorScreen.dart';
import 'package:blinkit_clone_app/pages/ElectronicsScreen.dart';
import 'package:blinkit_clone_app/components/SearchAppBar.dart';
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
            SizedBox(height: 5),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: ()=> changePage(0),
                    child: Column(
                      children: [
                        Icon(Icons.shopping_bag_outlined,
                        size: 20,),
                        Text(
                          "All",
                          style: TextStyle(
                            fontWeight: currIndex==0? FontWeight.bold: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> changePage(1),
                    child: Column(
                      children: [
                        Icon(Icons.headphones_rounded, size: 20,),
                        Text(
                          "Electronics",
                          style: TextStyle(
                            fontWeight: currIndex==1? FontWeight.bold: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> changePage(2),
                    child: Column(
                      children: [
                        Icon(Icons.face_retouching_natural,size: 20,),
                        Text(
                          "Beauty",
                          style: TextStyle(
                            fontWeight: currIndex==2 ? FontWeight.bold: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> changePage(3),
                    child: Column(
                      children: [
                        Icon(Icons.light, size: 20,),
                        Text(
                          "Decor",
                          style: TextStyle(
                              fontWeight: currIndex==3 ? FontWeight.bold: FontWeight.normal
                          ),
                        ),
                      ],
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