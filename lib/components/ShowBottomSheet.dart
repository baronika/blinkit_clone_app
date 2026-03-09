import 'package:blinkit_clone_app/components/Filter.dart';
import 'package:blinkit_clone_app/components/Grids3.dart';
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
        padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 400,
            height: 600,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Favourites",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                SizedBox(height: 10,),
                Flexible(
                    child: Grids3()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}