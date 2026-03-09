import 'package:blinkit_clone_app/data/category_model.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/services/api/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grids extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GridsState();

}

class _GridsState extends State<Grids>{
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
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: categories.take(6).length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context,index){
          Category category=categories.take(6).toList()[index];
          return GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, AppRoutes.category_screen),
            },
            child: Card(
              color: Color(0xFFE2EEF1),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.face_retouching_natural,
                      size: 40,
                    ),
                    Text(
                      category.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}