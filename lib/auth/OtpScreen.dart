import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:blinkit_clone_app/services/db/firestore_service.dart';
import 'package:blinkit_clone_app/services/shared_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OtpScreen extends StatefulWidget{

  final String verificationId;
  final String phoneNumber;
  final String name;

  const OtpScreen({Key? key, required this.verificationId, required this.phoneNumber, required this.name}): super(key: key);

  @override
  State<StatefulWidget> createState() => _OtpScreenState();
}
class _OtpScreenState extends State<OtpScreen>{
  final List<TextEditingController> otpControllers = List.generate(6, (_)=> TextEditingController());

  final TextEditingController otpController = TextEditingController();

  void verifyOtp() async{
    PhoneAuthCredential credential=PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text);

    UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);

    print("Login Successful");
    await SharedHelper.saveLogin(true);
    await SharedHelper.savePhoneName(widget.name,widget.phoneNumber);
    await FirestoreService().saveUserToFirestore(widget.name);
    Navigator.pushNamed(context, AppRoutes.home);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text("Enter 6 digit OTP",
            style: TextStyle(
              fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            Pinput(
              controller: otpController,
              length: 6,
              keyboardType: TextInputType.number,
              onCompleted: (pin){
                verifyOtp();
              },
            ),
            SizedBox(height: 40),

            GestureDetector(
              onTap: (){ verifyOtp();},
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF649A4E),
                    ),
                    child: Text("Verify",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),)
                ),
              ),

          ],
        )
      ),
      ),
    );
  }
}