import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (quantity == 0) {
          setState(() {
            quantity = 1;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 140,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF649A4E),
        ),
        child: quantity == 0
            ? Center(
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            : Row(
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
                      size: 20,
                    ),
                  ),
                  Text("$quantity",
                    style: TextStyle(
                        color: Colors.white,
                    fontSize: 20,
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
                      size: 20,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
