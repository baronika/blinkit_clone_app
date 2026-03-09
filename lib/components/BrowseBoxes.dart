import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowseBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BrowseSingleBox(),
              SizedBox(width: 20),
              BrowseSingleBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class BrowseSingleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        GestureDetector(
          onTap: ()=>{Navigator.pushNamed(context, AppRoutes.category_screen)},
          child: Container(
            width: 140,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Color(0xC0D3D3FD)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 140,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Color(0xC0D3D3FD),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset("assets/icons/67419100_9662747.png"),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Headphone", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("60 Products", style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
