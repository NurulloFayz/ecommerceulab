

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../pages/auth_pages/enter_email_code_page.dart';


class ViewEmailPage extends ChangeNotifier{
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phoneNumber = TextEditingController();
  //var birthDate = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  String typedText = '';
  changeValue(value) {
    typedText = value;
    notifyListeners();
  }
  void showEmail(BuildContext context,String email) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EnterEmailCodePage(email)));
  }

  Future<void> loginUser(String email,String name,String phoneNumber) async {
    var url = Uri.parse('https://ulab-market-backend.onrender.com/auth/register');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'name': name,
        'phone_number': phoneNumber,
      }),
    );
    if (response.statusCode == 200) {
      // Successful login, handle response data
      var responseData = jsonDecode(response.body);
      print('Login successful: $responseData');
    } else {
      // Handle login failure
      print('Login failed: ${response.body}');
    }
  }

}