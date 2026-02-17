import 'package:blinkit_clone_app/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget{
  final String generatedOtp;
  final String phone;
  const OtpScreen({ super.key, required this.generatedOtp, required this.phone});
  @override
  State<StatefulWidget> createState() => _OtpScreenState();
}
class _OtpScreenState extends State<OtpScreen>{
  final List<TextEditingController> otpControllers = List.generate(6, (_)=> TextEditingController());

  final TextEditingController otpController = TextEditingController();

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
            Text("Enter 6 digit OTP"),
            Text(
              "Otp is ${widget.generatedOtp}",
            style: TextStyle(
              fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            Pinput(
              controller: otpController,
              length: 6,
              keyboardType: TextInputType.number,
              onCompleted: (pin){
                verifyOtp(pin);
              },
            ),
            SizedBox(height: 40),

            SizedBox(
                height: 55, width: 120,
              child: ElevatedButton(
                  onPressed: () => verifyOtp(otpController.text),
                  child: Text("Verify"),
              ),
            ),
          ],
        )
      ),
      ),
    );
  }
  void verifyOtp(String pin) {
    if(pin==widget.generatedOtp){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text("OTP Verified"),
        ),
      );
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
    else{
      print("Invalid OTP");
    }
  }
}