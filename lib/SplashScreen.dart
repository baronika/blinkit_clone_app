import 'package:blinkit_clone_app/routes.dart';
import 'package:blinkit_clone_app/services/shared_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Image.asset(
            'assets/icons/blinkit-logo-vector_logoshape.com.png',
          width: 150,
        ),
      ),
    );
  }

  void checkLogin() async{
    bool isLoggedIn=await SharedHelper.isLoggedIn();
    await Future.delayed(Duration(seconds: 2));
    if(isLoggedIn){
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
    else{
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }
}