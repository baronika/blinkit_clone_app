import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/services/db/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'address_bottom_sheet.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String hintText;
  final Function(String)? onChanged;
  final VoidCallback onProfileTap;

  const SearchAppBar({
    Key? key,

    this.hintText = "Search...",
    this.onChanged,
    required this.onProfileTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2.7);
}

class _SearchAppBarState extends State<SearchAppBar>{
  String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.yellow,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Blinkit in",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "8 minutes",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      StreamBuilder(
                        stream: firestoreService.getAddress(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                            return Row(
                              children: [
                                Text("Add address"),
                                GestureDetector(
                                  onTap: () async {
                                    var result=await AddressBottomSheet.showAddressBottomSheet(context);
                                    if(result!=null){
                                      setState(() {
                                        selectedAddress=result["address"];
                                      });
                                    }
                                  },
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                              ],
                            );
                          }
                          var data = snapshot.data!.docs;
                          selectedAddress??=data.first.data()["address"];

                          return GestureDetector(
                            onTap: () async {
                              var result=await AddressBottomSheet.showAddressBottomSheet(context);
                              if(result!=null){
                                setState(() {
                                  selectedAddress=result["address"];
                                });
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  selectedAddress ?? "",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    iconSize: 48,
                    onPressed: widget.onProfileTap,
                    icon: Icon(Icons.account_circle_rounded),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.mic),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.search_screen);
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

}


