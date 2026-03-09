import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_AddButton1State();

}

class _AddButton1State extends State<AddButton1>{
  @override
  Widget build(BuildContext context) {
    int quantity=1;
    return Container(
        alignment: Alignment.center,
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF649A4E),
        ),
        child:
            Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity--;
                });
              },
              child: Icon(Icons.remove,
                color: Colors.white,
                size: 16,
              ),
            ),
            Text("$quantity",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              child: Icon(Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),

    );
  }
}