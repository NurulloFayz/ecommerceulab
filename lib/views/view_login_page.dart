

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../pages/pages.dart';

class ViewLogInPage extends ChangeNotifier {
  var login = TextEditingController();
  var password = TextEditingController();
  String typedText = '';
  changeValue(value) {
    typedText = value;
    notifyListeners();
  }

  Future<void> logIn (String password,String login,BuildContext context) async {
    var url = Uri.parse('https://ulab-market-backend.onrender.com/auth/login');
   // checkEmail = email;

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'login': login,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setString('email', checkEmail);
      //view.navigateToMyPages(context);
      // Successful login, handle response data
      var responseData = jsonDecode(response.body);
      print(responseData['token']);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyPages()));
      print('Login successful: $responseData');
    } else {
      // Handle login failure
      print('Login failed: ${response.body}');
    }
  }
  Color color = const Color(0xFFF5F6F8);
  bool obscurePassword = true;
}