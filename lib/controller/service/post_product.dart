import 'dart:convert';
import 'package:http/http.dart' as http;

class PostProductModel {
  final int quantity;
  final String productId;

  PostProductModel({required this.quantity, required this.productId});

  factory PostProductModel.fromJson(Map<String, dynamic> json) =>
      PostProductModel(
        quantity: json["quantity"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "product_id": productId, // Changed key to "product_id"
  };
}

Future<void> postData(String productId, int quantity) async {
  final url = Uri.parse('https://ulab-market-backend.onrender.com/api/basket');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'product_id': productId,
    'quantity': quantity,
  });

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    // Request successful, handle response here
    print('Posted successfully');
  } else {
    // Request failed, handle error here
    print('Failed to post: ${response.reasonPhrase}');
  }
}
