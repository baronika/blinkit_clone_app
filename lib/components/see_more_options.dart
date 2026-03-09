import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeMoreOptions extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{Navigator.pushNamed(context, AppRoutes.similar_screen)},
      child: Container(
          height: 50,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0x8EE1EFF8)
          ),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        height: 60,
                        width: 75,
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(color: Colors.black12)
                        ),
                        child: Image.asset("assets/icons/67419100_9662747.png"),
                      ),
                      Container(
                        height: 60,
                        width: 55,
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(color: Colors.black12)
                        ),
                        child: Image.asset("assets/icons/67419100_9662747.png"),
                      ),
                      Container(
                        height: 60,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(color: Colors.black12)
                        ),
                        child: Image.asset("assets/icons/67419100_9662747.png"),
                      ),
                    ],
                  ),

                  SizedBox(width: 10,),
                  Text("See more like this",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_ios,
                    color: Colors.indigo,
                    size: 15,)
                ],
              ),
      ),
    );
  }
}