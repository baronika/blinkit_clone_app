import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
  static Future<Map<String,dynamic>> login(String phone) async{
    final url=Uri.parse("https://delicate-rain-8f91.walkweltech.workers.dev/");
    final response=await http.post(
      url,
      headers: {
      "Content-Type": "application/json"},
        body: jsonEncode({
          "phone" : phone
        }),
    );
    final data=jsonDecode(response.body);
    if(response.statusCode==200 && data["token"]!=null){
      print("Login Success");
      print("Username: ${data["username"]}");
      print("Phone: ${data["phone"]}");
      print("Token: ${data["token"]}");
      return data;

    }
    else{
      throw Exception(" ${data["error"]}");
    }
  }
}