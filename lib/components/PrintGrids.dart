import 'package:blinkit_clone_app/components/custom_rating_bar.dart';
import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:blinkit_clone_app/services/api/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrintGrids extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _PrintGridsState();

}

class _PrintGridsState extends State<PrintGrids>{
  List<Product> printItems=[];

  @override
  void initState() {
    super.initState();
    loadPrintProducts();
  }

  void loadPrintProducts() async{
    ProductService service=ProductService();
    printItems=await service.fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: printItems.take(6).length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.42
        ),
        itemBuilder: (context,index){
          Product print=printItems.take(6).toList()[index];
          return Container(
            width: 140,
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
                        color: Colors.white,
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.network(print.thumbnail),
                            Expanded(
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.lightGreen,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white
                                ),
                                child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text("Print",
                                        style: TextStyle(
                                          fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green
                                        ),)),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite_border_outlined,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${print.stock} sheets",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.indigo,
                        ),
                      ),

                      Text(
                        print.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      custom_rating_bar(rating: print.rating),

                      Text(
                        "9 MINS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),

                      Text(
                        "${print.discountPercentage}% OFF",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        "Rs.${print.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}