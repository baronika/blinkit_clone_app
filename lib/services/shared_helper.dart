import 'package:shared_preferences/shared_preferences.dart';

// class SharedHelper {
//   static Future<void> saveLoginData({
//     required String token,
//     required String phone
// }) async {
//     final prefs= await SharedPreferences.getInstance();
//     await prefs.setBool("isLoggedIn", true);
//     await prefs.setString("token", token);
//     await prefs.setString("phone", phone);
//   }
//   static Future<bool> isLoggedIn() async{
//     final prefs=await SharedPreferences.getInstance();
//     return prefs.getBool("isLoggedIn")?? false;
//   }
//   static Future<void> logout() async{
//     final prefs=await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }

class SharedHelper {

  static Future<void> saveLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", value);
  }

  static Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }

  static Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("phone", phone);
  }

  static Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("phone");
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}