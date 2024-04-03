import 'dart:convert';
import 'package:ecommerce_ulab/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  static Future<List<CategoryModel>> getCategories() async {
    final url = Uri.parse('https://ulab-market-backend.onrender.com/api/category');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final categoryList = data.map((item) => CategoryModel.fromJson(item)).toList();
      return categoryList;
    } else {
      throw Exception('failed to get categories');
    }
  }
}
