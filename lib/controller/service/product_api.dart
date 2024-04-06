import 'dart:convert';

import '../../model/product_model.dart';
import 'package:http/http.dart' as http;

// class ProductApi {
//   static Future<List<Product>> getProduct() async {
//     final url = Uri.parse('https://ulab-market-backend.onrender.com/api/products');
//     final response = await http.get(url);
//     if(response.statusCode == 200) {
//       final data = jsonDecode(response.body) as List<dynamic>;
//       final products = data.map((item) => Product.fromJson(item)).toList();
//       return products;
//     } else {
//       throw Exception('failed to get products');
//     }
//   }
// }
class ProductApi {
  static Future<List<Product>> getProduct() async {
    final url = Uri.parse('https://ulab-market-backend.onrender.com/api/products');
    final response = await http.get(url);

    print('Response body: ${response.body}'); // Add this line to log response body

    if(response.statusCode == 200) {
      final List<dynamic>? data = jsonDecode(response.body) as List<dynamic>?;
      if (data != null) {
        final products = data.map((item) => Product.fromJson(item)).toList();
        print('products are got');
        return products;
      } else {
        throw Exception('Failed to decode data');
      }
    } else {
      throw Exception('Failed to get products');
    }
  }
}
