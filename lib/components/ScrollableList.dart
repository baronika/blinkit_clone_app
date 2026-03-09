import 'package:blinkit_clone_app/ItemDetailScreen.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/product_model.dart';
import '../services/api/product_service.dart';
import 'custom_rating_bar.dart';

class ScrollableList extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _ScrollableListState();

}
class _ScrollableListState extends State<ScrollableList>{
  List<Product> products = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    ProductService service = ProductService();
    products = await service.fetchProducts();

    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: ListView.builder(
            itemCount: products.take(5).length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) {
              Product product = products.take(5).toList()[index];
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AppRoutes.item_detail_screen, arguments: product);
                },
                child: SizedBox(
                  width: 150,
                    child: Card(
                    elevation: 0,
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 130,
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

                        Container(
                          child: Padding(padding: EdgeInsets.all(10),
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
                                // items[index]["text"]!,
                                  product.title,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              custom_rating_bar(rating: product.rating),
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
                                "Rs. ${product.price}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10,),
                              GestureDetector(
                                onTap: ()=>{Navigator.pushNamed(context, AppRoutes.similar_screen)},
                                child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0x4DBADC91)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("See more like this",
                                        style: TextStyle(
                                            color: Color(0xFF3D753D),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward_ios,
                                        color: Color(0xFF3D753D),
                                        size: 10,)
                                    ],
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                        ),
                      ],
                    ),
                    )
                ),
              );
            }
      )
    );
  }

}