import 'dart:math';

import 'package:blinkit_clone_app/routes.dart';
import 'package:blinkit_clone_app/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Mobile Number",
                ),
              ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                height: 55,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  onPressed: ()=> sendOtp(),
                  child: Text("Send OTP"),
                ),
              ),
              SizedBox(height: 100,),
            ],
          ),
          ),
      ),
    );
  }

  // void sendOtp() async{
  //   String mobileNumber= phoneController.text;
  //   if(mobileNumber.isEmpty){
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Please enter mobile number"),
  //       ),
  //     );
  //     return;
  //   }
  //
  //   final otp=(Random().nextInt(900000)+100000).toString();
  //   await ApiService.login(mobileNumber,otp);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("OTP sent to $mobileNumber"),
  //     ),
  //   );
  //   Navigator.pushNamed(context,
  //       AppRoutes.otp,
  //   arguments: {
  //     "phone": mobileNumber,
  //     "otp": otp,
  //   },
  //   );
  // }

  void sendOtp() async {
    String mobileNumber = phoneController.text;

    if (mobileNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter mobile number")),
      );
      return;
    }

    try {
      final response = await ApiService.login(mobileNumber);
      print(response["token"]);
      final otp = (Random().nextInt(900000) + 100000).toString();

      Navigator.pushNamed(
        context,
        AppRoutes.otp,
        arguments: {
          "phone": mobileNumber,
          "otp": otp,
        },
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

}