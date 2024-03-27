import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/product_model.dart';

class ProductService {
  static const String apiUrl =
      'https://ulab-market-backend.onrender.com/api/products';
 Future<String?> getToken() async {
   final storage =  FlutterSecureStorage();

// Read value
   String? token = await storage.read(key: 'token');
   print('token is $token');
     return token;
 }


  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${getToken()}',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      // Handle API error
      throw Exception('Failed to load products');
    }
  }
}
