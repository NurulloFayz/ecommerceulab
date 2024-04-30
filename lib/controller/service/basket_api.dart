import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/basket_model.dart';

class BasketApi {
  static Future<ProductList> fetchBusket() async {
    var url = Uri.parse("https://ulab-market-backend.onrender.com/api/basket");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return ProductList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load products');
    }
  }
}
