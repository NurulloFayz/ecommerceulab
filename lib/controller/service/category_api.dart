import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/category_model.dart';

class CategoryService {
  static final Uri apiUrl = Uri.parse("https://ulab-market-backend.onrender.com/api/category");

  static Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = jsonDecode(response.body) as List<dynamic>?;

        if (data != null) {
          return data.map((item) => CategoryModel.fromJson(item)).toList();
        } else {
          throw Exception('Failed to parse response: data is null');
        }
      } else {
        throw Exception('Failed to load categories, HTTP status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions and throw them as needed
      throw Exception('Error fetching categories: $e');
    }
  }
}
