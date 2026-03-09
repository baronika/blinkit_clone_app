import 'package:blinkit_clone_app/navigation/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyDIniNiTS4ftu6Kg57VP0UcB0B9MLia_Tk", appId: "1:671681958733:android:4e5b858a3680c64f7e5d04", messagingSenderId: "671681958733", projectId: "blinkit-clone-614a1"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFE000),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFFE000),
          foregroundColor: Colors.black,
        )
      ),

      initialRoute: AppRoutes.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
