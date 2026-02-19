import 'package:blinkit_clone_app/CategoriesScreen.dart';
import 'package:blinkit_clone_app/ItemDetailScreen.dart';
import 'package:blinkit_clone_app/LoginScreen.dart';
import 'package:blinkit_clone_app/OtpScreen.dart';
import 'package:blinkit_clone_app/ProfileScreen.dart';
import 'package:blinkit_clone_app/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blinkit_clone_app/SplashScreen.dart';
import 'package:blinkit_clone_app/bottom_nav_bar.dart';

import 'OrderAgainScreen.dart';
import 'PrintScreen.dart';

class AppRoutes{
  static const splash='/';
  static const login='/login';
  static const otp='/otp';
  static const home='/home';
  static const order_again='/order_again';
  static const categories='/categories';
  static const print='/print';
  static const profile='/profile';

  static const search_screen='/search_screen';
  static const item_detail_screen='/item_detail_screen';

}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen(),
        );
      case AppRoutes.otp:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(
            phone: args["phone"],
            generatedOtp: args["otp"],),
        );
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => BottomNavBar(),
        );
      case AppRoutes.order_again:
        return MaterialPageRoute(builder: (_)=> OrderAgainScreen(),
    );
      case AppRoutes.categories:
        return MaterialPageRoute(builder: (_)=> CategoriesScreen(),
        );
      case AppRoutes.print:
        return MaterialPageRoute(builder: (_)=> PrintScreen(),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case AppRoutes.search_screen:
        return MaterialPageRoute(builder: (_)=> SearchScreen());
      case AppRoutes.item_detail_screen:
        return MaterialPageRoute(builder: (_)=> ItemDetailScreen());
      default:
        return MaterialPageRoute(builder: (_)=> Scaffold(
          body: Center(
            child: Text("404")),
        ),
        );
    }
  }
}
