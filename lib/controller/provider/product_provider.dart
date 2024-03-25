

import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';
import '../service/product_service.dart';

class ProductProvider extends ChangeNotifier{
  final ProductService _productService = ProductService();
  List<Product> _products = [];

  Future<List<Product>> getProducts() async {
    if (_products.isEmpty) {
      _products = await _productService.getProducts();
    }
    return _products;
  }
}
