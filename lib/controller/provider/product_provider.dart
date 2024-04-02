
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';
import '../service/product_service.dart';

class ProductProvider extends ChangeNotifier{
   static Future<List<Product>?> getProductList() async {
    final url = Uri.parse('https://ulab-market-backend.onrender.com/api/products/');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final products = data.map((item) => {
        Product.fromJson(item)
      }).toList();
    }
  }
  final ProductService _productService = ProductService();
  List<Product> _products = [];

  Future<List<Product>> getProducts() async {
    if (_products.isEmpty) {
      _products = await _productService.getProducts();
    }
    return _products;
  }
}
