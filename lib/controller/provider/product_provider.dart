

import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';
import '../service/product_service.dart';

class ProductProvider extends ChangeNotifier{
  final ProductService _productService = ProductService();
  List<Product> _products = [];

  List<Product> get getProducts => _products;

  Future<void> fetchProducts()async{
    try{
      final products = await ProductService().getProducts();
      _products = products;
      print("all products are fetched ${products}");
      notifyListeners();
    }catch(e){}
  }
}
