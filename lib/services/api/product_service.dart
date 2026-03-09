import 'dart:convert';
import 'package:blinkit_clone_app/data/category_model.dart';
import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:blinkit_clone_app/services/api/product_response.dart';
import 'package:http/http.dart' as http;


class ProductService {
  Future<List<Product>> fetchProducts() async{
    final response=await http.get(Uri.parse("https://dummyjson.com/products"));
    if(response.statusCode==200){
      final data = json.decode(response.body);
      List productsJson = data["products"];
      return productsJson.map((e)=> Product.fromJson(e)).toList();

    } else {
      throw Exception("Failed to load products");
    }
  }
  Future<List<Category>> getCategory() async{
    final response=await http.get(Uri.parse("https://dummyjson.com/products/categories"));
    if(response.statusCode==200){
      final data = json.decode(response.body);
      List categoryJson = data;
      return categoryJson.map((e)=> Category.fromJson(e)).toList();

    } else {
      throw Exception("Failed to load product categories");
    }
  }
  Future<List<Product>> fetchProductByCategory(String category) async{
    final response=await http.get(Uri.parse("https://dummyjson.com/products/category/$category"));
    if(response.statusCode==200){
      final data=json.decode(response.body);
      List productJson=data["products"];
      return productJson.map((e)=> Product.fromJson(e)).toList();
    }
    else{
      throw Exception("Failed to load products by category");
    }
  }
}