import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/api/product_service.dart';
import 'custom_rating_bar.dart';

class CategoryItemsGrid extends StatefulWidget{
  final String category;

  const CategoryItemsGrid({super.key, required this.category});

  @override
  State<StatefulWidget> createState() => _CategoryItemsGrid();
}

class _CategoryItemsGrid extends State<CategoryItemsGrid>{
  List<Product> categoryItems=[];
  bool isLoading=true;
  @override
  void initState() {
    super.initState();
    loadProductsByCategory();
  }

  @override
  void didUpdateWidget(covariant CategoryItemsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.category!=widget.category){
      loadProductsByCategory();
    }
  }

  void loadProductsByCategory() async {
    ProductService service = ProductService();
    categoryItems = await service.fetchProductByCategory(widget.category);

    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoryItems.take(10).length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.48
        ),
        itemBuilder: (context,index){
        Product product=categoryItems.take(10).toList()[index];
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.category_screen,arguments: product);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF1F7F8),
                        ),
                          child: Image.network(
                            product.thumbnail,
                            fit: BoxFit.cover,
                          ),

                      ),

                      Positioned(
                        top: 5,
                        right: 1,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 18,
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 28,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.stock} sets",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.indigo,
                          ),
                        ),

                        Text(
                          product.title,
                          // categoryItems[index]["text"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        custom_rating_bar(rating: 5),

                        Text(
                          "9 MINS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),

                        Text(
                          "${product.discountPercentage}% OFF",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.blueAccent,
                          ),
                        ),

                        Text(
                          "Rs.${product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          );

        }
        );
  }
}