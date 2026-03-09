import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/routes.dart';

class SavedAddressList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SavedAddressListState();
}

class _SavedAddressListState extends State<SavedAddressList> {
  final List<Map<String, String>> savedAddressList = [
    {
      "name": "Home",
      "distance": "9.5 km away",
      "address": "Home Full address",
      "phone": "9868654322",
    },
    {
      "name": "Home",
      "distance": "9.5 km away",
      "address": "Home Full address",
      "phone": "9868654322",
    },
    {
      "name": "Home",
      "distance": "9.5 km away",
      "address": "Home Full address",
      "phone": "9868654322",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: savedAddressList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () => {
                // Navigator.pushNamed(context, AppRoutes.item_detail_screen),
              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F4ED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.home, color: Colors.amber),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "9.5 km away",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF3F916D),
                              ),
                            ),
                          ],
                        ),
                        Text("Home Full address \n"),
                        Text(
                          "Phone number: 9868654322",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.more_horiz, color: Colors.green, size: 30),
                            SizedBox(width: 10),
                            Icon(
                              Icons.ios_share_rounded,
                              color: Colors.green,
                              size: 23,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
