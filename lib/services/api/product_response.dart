import 'package:blinkit_clone_app/data/product_model.dart';

class ProductResponse {
  final List<Product> products;

  ProductResponse({required this.products});
  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      products: (json["products"] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }
}