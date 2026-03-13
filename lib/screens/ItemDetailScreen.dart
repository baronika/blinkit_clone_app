import 'package:blinkit_clone_app/components/Boxes.dart';
import 'package:blinkit_clone_app/components/Grids.dart';
import 'package:blinkit_clone_app/components/Grids3.dart';
import 'package:blinkit_clone_app/components/ScrollableList.dart';
import 'package:blinkit_clone_app/components/SingleDetailBox.dart';
import 'package:blinkit_clone_app/components/add_button.dart';
import 'package:blinkit_clone_app/components/custom_rating_bar.dart';
import 'package:blinkit_clone_app/components/go_to_cart.dart';
import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/components/see_more_options.dart';
import 'package:blinkit_clone_app/components/BrowseBoxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatefulWidget {
  final Product product;

  const ItemDetailScreen({super.key, required this.product});
  @override
  State<StatefulWidget> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int quantity=0;
  bool showMore=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_drop_down,),
                      onTap: ()=> Navigator.pop(context),
                    ),
                    Text(
                      widget.product.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                Icon(Icons.favorite_border_rounded),
                Icon(Icons.search_rounded),
                Icon(Icons.ios_share_rounded),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Color(0xFFE2EEF1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black26, Color(0xFFE2EEF1)],
                      ),
                    ),
                    child: Image.network(widget.product.thumbnail),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "9 MINS",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                              SizedBox(width: 20),
                              custom_rating_bar(rating: widget.product.rating),
                              SizedBox(width: 5),
                              Text(
                                "(20,466)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.product.title,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${widget.product.stock} set",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "MRP Rs.${widget.product.price}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "View Product detail",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                color: Colors.green,
                                  icon: Icon( showMore?
                                      Icons.arrow_drop_up : Icons.arrow_drop_down,),
                                    onPressed: () {
                                    setState(() {
                                      showMore=!showMore;
                                    });
                                    },
                                  ),
                            ],
                          ),
                          if(showMore)
                            Text(
                              widget.product.description,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.product.brand,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Similar Products",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SingleDetailBox(),
                          SingleDetailBox(),
                          SeeMoreOptions(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: 220,
              margin: EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
                child: GoToCart()),
          )
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xC0FFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1 set",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Rs.5000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 10),

                    Container(
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFD8E8F6),
                      ),
                      child: Text(
                        "15% OFF",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Inclusive of all taxes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            AddButton(),
          ],
        ),
      ),
    );
  }
}
