import 'package:blinkit_clone_app/Filter.dart';
import 'package:blinkit_clone_app/Grids3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return const _ShowBottomSheetState();
      },
    );
  }

}

class _ShowBottomSheetState extends StatelessWidget{
  const _ShowBottomSheetState();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 400,
            height: 600,
            child: Column(
              children: [
                Text("Favourites",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Box1(),
                    SizedBox(width: 15),
                    Box1(),
                    SizedBox(width: 15),
                    Box1()
                  ],
                ),
                SizedBox(height: 20),
                Grids3(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}