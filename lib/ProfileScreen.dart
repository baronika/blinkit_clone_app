import 'package:blinkit_clone_app/AppearanceDropDown.dart';
import 'package:blinkit_clone_app/Boxes.dart';
import 'package:blinkit_clone_app/Grids.dart';
import 'package:blinkit_clone_app/ScrollableList.dart';
import 'package:blinkit_clone_app/ToggleButton.dart';
import 'package:blinkit_clone_app/routes.dart';
import 'package:blinkit_clone_app/services/shared_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_outlined)),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Color(0xC0F2F2FA),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,colors: [
                      Colors.yellow,
                      Color(0xC0F2F2FA),
                    ])
                ),
                child: Column(
                  children: [
                    Icon(Icons.account_circle_rounded,
                      size: 80,),
                    Text("Customer Name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Customer Detail",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                    ),

                  ],
                ),
              ),

              Boxes(),

              Container(
                child: Padding(padding: EdgeInsets.fromLTRB(20,10,20,10),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 10,),
                          Text("Appearance"),
                          SizedBox(width: 120,),
                          AppearanceDropDown(),
                        ]
                    ),
                  ),
                ),

              ),
              Container(
                child: Padding(padding: EdgeInsets.fromLTRB(20,10,20,10),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Icon(Icons.sunny),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hide sensitive items"),
                            Text("Know more",
                              style: TextStyle(
                                  color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 150,),
                        ToggleButton(),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
            child: Padding(padding: EdgeInsets.fromLTRB(20,10,20,10),
              child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: Padding(padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.bookmark_add_outlined),
                                    SizedBox(width: 10,),
                                    Text("Address Book",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Icon(Icons.bookmark_border),
                                    SizedBox(width: 10,),
                                    Text("Bookmark recipes",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border_rounded),
                                    SizedBox(width: 10,),
                                    Text("Your wishlist",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),

                                Row(
                                  children: [
                                    Icon(Icons.wallet_giftcard_rounded),
                                    SizedBox(width: 10,),
                                    Text("E-gift cards",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            )
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
              Container(
                child: Padding(padding: EdgeInsets.fromLTRB(20,10,20,10),
                  child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Payment and Coupons",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.bookmark_add_outlined),
                                        SizedBox(width: 10,),
                                        Text("Address Book",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Icon(Icons.bookmark_border),
                                        SizedBox(width: 10,),
                                        Text("Bookmark recipes",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Icon(Icons.favorite_border_rounded),
                                        SizedBox(width: 10,),
                                        Text("Your wishlist",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),

                                    Row(
                                      children: [
                                        Icon(Icons.wallet_giftcard_rounded),
                                        SizedBox(width: 10,),
                                        Text("E-gift cards",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              Container(
                child: Padding(padding: EdgeInsets.fromLTRB(20,10,20,10),
                  child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Other Information",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.info),
                                        SizedBox(width: 10,),
                                        Text("About us",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Icon(Icons.lock),
                                        SizedBox(width: 10,),
                                        Text("Account privacy",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            await SharedHelper.logout();
                                            Navigator.pushReplacementNamed(context, AppRoutes.login);
                                        },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shadowColor: Colors.transparent
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.logout),
                                              SizedBox(width: 10,),
                                              Text("Log out",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),

              SizedBox(
                child: Padding(padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("blinkit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          fontSize: 30,
                        ),),
                      Text("v1.00.4",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                        ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}