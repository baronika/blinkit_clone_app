import 'package:blinkit_clone_app/components/Grids.dart';
import 'package:blinkit_clone_app/data/category_model.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/services/api/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import '../components/SearchAppBar.dart';

class CategoriesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _CategoriesScreenState();

}

class _CategoriesScreenState extends State<CategoriesScreen>{
  List<Category> categories=[];
  @override
  void initState() {
    super.initState();
    loadCategories();
  }
  void loadCategories() async{
    ProductService service=ProductService();
    categories=await service.getCategory();
    setState(() {

    });
  }
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