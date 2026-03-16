import 'package:blinkit_clone_app/services/db/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAddressBottomSheet extends StatefulWidget {
  final String heading;
  final String? addressId;
  const AddAddressBottomSheet({super.key, required this.heading, this.addressId});

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();

  static void show(BuildContext context,String heading,String addressId){
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
        return AddAddressBottomSheet(heading: heading, addressId: addressId);
      },
    );
  }

}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  final nameController = TextEditingController();
  final fullAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  List<String> forWhom = ["Myself", "Someone else"];
  String selectedOption = "Myself";

  final FirestoreService firestoreService=FirestoreService();

  @override
  void initState() {
    super.initState();

  }
  void saveAddress() async{
    await firestoreService.addAddress(
          address: fullAddressController.text,
          name: nameController.text,
          phone: phoneNumberController.text,
          forWhom: selectedOption);
    Navigator.pop(context);
  }

  void updateAddress() async{
    await firestoreService.updateAddress(
        id: widget.addressId!,
        address: fullAddressController.text,
        name: nameController.text,
        phone: phoneNumberController.text,
        forWhom: selectedOption);
    Navigator.pop(context);

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        height: 500,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.heading,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                GestureDetector(
                  onTap: (){Navigator.pop(context);},
                    child: Icon(Icons.cancel)
                )],
            ),
            SizedBox(height: 20),
            Text("Who are you ordering for?"),
            Row(
              children: forWhom.map((option) {
                return Expanded(
                  child: RadioListTile<String>(
                    title: Text(option,
                    style: TextStyle( fontSize: 11),),
                    value: option,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            TextField(
              controller: fullAddressController,
              decoration: InputDecoration(
                labelText: "Full Address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: "Your phone number",
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                if(widget.addressId==null){
                  saveAddress();
                }
                else updateAddress();
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF649A4E),
                  ),
                  child: Text("Save Address",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),)
              ),
            ),

          ],
        ),
      ),
    );
  }
}
