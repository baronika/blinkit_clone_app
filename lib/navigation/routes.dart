import 'package:blinkit_clone_app/screens/CategoriesScreen.dart';
import 'package:blinkit_clone_app/screens/ItemDetailScreen.dart';
import 'package:blinkit_clone_app/auth/LoginScreen.dart';
import 'package:blinkit_clone_app/auth/OtpScreen.dart';
import 'package:blinkit_clone_app/screens/SearchScreen.dart';
import 'package:blinkit_clone_app/screens/category_screen.dart';
import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:blinkit_clone_app/screens/similar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blinkit_clone_app/screens/SplashScreen.dart';

import '../ProfileScreen.dart';
import '../screens/CheckoutScreen.dart';
import '../screens/OrderAgainScreen.dart';
import '../screens/PrintScreen.dart';
import 'bottom_nav_bar.dart';

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
  static const checkout_screen='/checkout_screen';
  static const category_screen='/category_screen';
  static const similar_screen='/similar_screen';

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
          builder: (_) => OtpScreen(verificationId: '', phoneNumber: '', name: '',),
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
        final product=settings.arguments as Product;
        return MaterialPageRoute(builder: (_)=> ItemDetailScreen(product: product,));
      case AppRoutes.checkout_screen:
        return MaterialPageRoute(builder: (_)=> CheckOutScreen());
      case AppRoutes.category_screen:
        return MaterialPageRoute(builder: (_)=> CategoryScreen());
      case AppRoutes.similar_screen:
        return MaterialPageRoute(builder: (_)=> SimilarScreen());
      default:
        return MaterialPageRoute(builder: (_)=> Scaffold(
          body: Center(
            child: Text("404")),
        ),
        );
    }
  }
}
