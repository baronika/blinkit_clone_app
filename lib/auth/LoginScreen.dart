import 'dart:math';

import 'package:blinkit_clone_app/auth/OtpScreen.dart';
import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/services/api_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    phoneNumber = number.phoneNumber!;
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                  initialValue: number,
                  textFieldController: phoneController,
                  formatInput: true,
                  keyboardType: TextInputType.number,
                  inputDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter phone number",
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => sendOtp(),
                  child: Text("Send OTP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth auth=FirebaseAuth.instance;
  String verificationId='';
  void sendOtp() async{
    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter phone number")),
      );
      return;
    }
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e){
          print(e.message);
        },
        codeSent: (String verId,int? resetToken){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen( verificationId: verId, phoneNumber: phoneNumber,)));
          print("OTP sent");
        },
        codeAutoRetrievalTimeout: (String verId){
          verificationId=verId;
        }
        );
  }
}
