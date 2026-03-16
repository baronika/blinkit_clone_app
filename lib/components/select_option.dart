import 'package:blinkit_clone_app/components/add_address_bottom_sheet.dart';
import 'package:blinkit_clone_app/components/address_bottom_sheet.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/services/db/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SelectOption{

  static void selectOptionBottomSheet(BuildContext context, String addressId){
    showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xFFEEF1FA),
        builder: (context){
          return  _SelectOptionState(addressId: addressId);
        });
  }
}

class _SelectOptionState extends StatelessWidget{
  final String addressId;

  const _SelectOptionState({super.key, required this.addressId});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService=FirestoreService();

    return Padding(
        padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select option",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                  padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        firestoreService.deleteAddress(addressId);
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.delete_outline_rounded),
                              SizedBox(width: 10,),
                              Text("Delete address"),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,size: 20,)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: ()=>
                      {
                        Navigator.pop(context),
                        AddAddressBottomSheet.show(context, "Edit address", addressId)
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.edit_outlined),
                              SizedBox(width: 10,),
                              Text("Edit address"),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,size: 20,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}