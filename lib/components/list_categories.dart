import 'package:blinkit_clone_app/data/category_model.dart';
import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/routes.dart';
import '../services/api/product_service.dart';

class ListCategories extends StatefulWidget {

  final Function(String) onCategoryTap;
  const ListCategories({super.key, required this.onCategoryTap});

  // final TextEditingController categoryController;
  // String selectedCategory="Beauty";
  //
  // const ListCategories({super.key, required this.categoryController});


  @override
  State<StatefulWidget> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  List<Category> categories=[];

  bool isLoading = true;
  @override
  void initState() {
      super.initState();
      loadCategories();
    }

  void loadCategories() async {
    ProductService service = ProductService();
    categories = await service.getCategory();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return const Center(child: CircularProgressIndicator(),);
    }
    return Container(
      child: ListView.builder(
        itemCount: categories.take(10).length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          Category category=categories.take(10).toList()[index];
          return GestureDetector(
            onTap: () {
              widget.onCategoryTap(category.slug);
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                      Container(
                        width:60,
                        height: 60,
                        child: Icon(Icons.face_retouching_natural,
                          size: 24,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F7F8),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ), //just a placeholder
                      // Image.network(
                      //   "",
                      //   height: 80,
                      // ),
                      Text(
                        category.name
                      ),
                    ],
                  ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
          );
        },
      ),
    );
  }
}
