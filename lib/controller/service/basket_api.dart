import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/basket_model.dart';

class BasketApi {
  static Future<ProductList> fetchBusket(String token) async {
    var url = Uri.parse("https://ulab-market-backend.onrender.com/api/basket");

    // Construct headers with the token
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return ProductList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load basket');
    }
  }
}
