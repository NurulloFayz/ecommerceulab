import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../pages/auth_pages/enter_email_code_page.dart';

class ViewEmailPage extends ChangeNotifier {
  ViewEmailPage();

  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phoneNumber = TextEditingController();

  //var birthDate = TextEditingController();
  bool need_code = true;
  final FocusNode textFieldFocusNode = FocusNode();
  String typedText = '';

  changeValue(value) {
    typedText = value;
    notifyListeners();
  }

  void showEmail(BuildContext context, String email) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => EnterEmailCodePage(email)));
  }

  Future<void> loginUser() async {
    var url = Uri.parse('https://ulab-market-backend.onrender.com/api/auth/login');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'source': email.text, // Corrected the field name to 'email'
        'type': 'email'
      }),
    );

    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      // Successful login, handle response data
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print('email is ${responseData['email']}');
      // You might want to save the token or user data to SharedPreferences
      // Example: preferences.setString('token', responseData['token']);
    } else {
      // Handle login failure
      print('Login failed with status code ${response.statusCode}: ${response.body}');
      // You might want to show a message to the user indicating login failure
      // Example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }


  Color color = const Color(0xFFF5F6F8);
}
