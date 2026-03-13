import 'package:blinkit_clone_app/components/add_address_bottom_sheet.dart';
import 'package:blinkit_clone_app/components/saved_address_list.dart';
import 'package:blinkit_clone_app/services/db/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressBottomSheet {
  static Future<dynamic> showAddressBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFFEEF1FA),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return const _AddressBottomSheetState();
      },
    );
  }
}

class _AddressBottomSheetState extends StatelessWidget {
  const _AddressBottomSheetState();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select delivery location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add, color: Colors.green, size: 25),
                              SizedBox(width: 10),
                              Text(
                                "Add new address",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Colors.blueGrey,
                          ),
                        ],
                      ),
                      onTap: () => {
                        Navigator.pop(context),
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Color(0xFFEEF1FA),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return AddAddressBottomSheet(heading: "Enter complete address",);
                          },
                        ),
                      },
                    ),
                    SizedBox(height: 20),

                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Import your address from Zomato",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Colors.blueGrey,
                          ),
                        ],
                      ),

                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Request address from someone",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Your saved addresses"),
            SizedBox(height: 20),
            SavedAddressList(),
          ],
        ),
      ),
    );
  }
}
