import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'address_bottom_sheet.dart';

class CustomAppBar extends StatelessWidget{
  final String title;
  final String address;

  const CustomAppBar({super.key, required this.title, required this.address});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500)
              ),
              Row(
                children: [
                  Text("Delivering to : ",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold)
                  ),
                  Text(address,
                      style: TextStyle(
                        fontSize: 12,)
                  ),
                  GestureDetector(
                    onTap: () {
                      AddressBottomSheet.showAddressBottomSheet(context);
                    },
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ],
          ),

          Icon(Icons.search_rounded),

          Container(
            child: Row(
              children: [
                Icon(
                  Icons.ios_share_rounded,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}