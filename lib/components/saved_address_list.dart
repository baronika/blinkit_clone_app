import 'package:blinkit_clone_app/components/select_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigation/routes.dart';
import '../services/db/firestore_service.dart';
import 'package:share_plus/share_plus.dart';
class SavedAddressList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SavedAddressListState();
}

class _SavedAddressListState extends State<SavedAddressList> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: StreamBuilder(
          stream: firestoreService.getAddress(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No saved addresses"));
            }
            var docs = snapshot.data!.docs;
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20,),
              itemCount: docs.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var doc=docs[index];
                var data=doc.data();
                String addressId=doc.id;
                return GestureDetector(
                  onTap: (){
                    Navigator.pop(context,data);
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
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
                                    data["name"]??"",
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
                              Text(data["address"]?? ""),
                              Text(
                                "Phone number: ${data["phone"]??""}",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      SelectOption.selectOptionBottomSheet(context,addressId);
                                    },
                                    child: Icon(Icons.more_horiz, color: Colors.green,
                                        size: 30),
                                  ),
                                  SizedBox(width: 10),
                                  IconButton(
                                      icon: Icon(
                                        Icons.ios_share_rounded,
                                        color: Colors.green,
                                        size: 23,
                                      ),
                                    onPressed: (){
                                        Share.share("Share address");
                                    },
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

            );
          }
      ),
    );
  }
}