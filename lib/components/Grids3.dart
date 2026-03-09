import 'package:blinkit_clone_app/components/custom_rating_bar.dart';
import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/api/product_service.dart';

class Grids3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _Grids3();

}

class _Grids3 extends State<Grids3>{
  bool isLoading = true;

  List<Product> favouriteItems=[];
  void initState() {
    super.initState();
    loadProducts2();
  }

  void loadProducts2() async {
    ProductService service = ProductService();

    favouriteItems = await service.fetchProducts();

    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: favouriteItems.take(6).length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3,
            mainAxisSpacing: 10,
            childAspectRatio: 0.39
        ),
        itemBuilder: (context,index){
          Product product=favouriteItems.take(6).toList()[index];
          return Container(
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
                          fit: BoxFit.contain,
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
                          "${product.stock}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.indigo,
                          ),
                        ),

                        Text(
                          product.title,
                          // items[index]["text"]!,
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
              )
          );
        }
    );
  }
}