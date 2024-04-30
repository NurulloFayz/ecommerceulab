
// "{
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTE0NjA4NzYsInVpZCI6IjUifQ.lZeqec6k0o68f9ZX1XMSfnJagBf6fusYmIsrKipK1w0",
//     "success": true
// }

import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/pages/auth_pages/enter_name_bdate.dart';
import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewEnterEmailCodePage extends ChangeNotifier{
  String? sent_email;
  late String checkEmail;
  void focusScope(BuildContext context) {
    FocusScope.of(context).nextFocus();
    notifyListeners();
  }
  var emailCode = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  String otpCode = '';
  changeValue(value) {
    otpCode = value;
    notifyListeners();
  }
  backToEmailPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, EmailPage.id);
  }
  void navigateToEnterNameBDatePage(BuildContext context) {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const EnterNameBDatePage()));
  }
  void navigateToMyPages(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyPages()));
  }

  Future<void> enterPassword(String password, String email, BuildContext context) async {
    var url = Uri.parse("https://ulab-market-backend.onrender.com/api/auth/verify_code");
    checkEmail = email;

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'code': emailCode.text,
        'type': 'email',
        'source': email, // Corrected the field name to 'email'
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      SharedPreferences preferences = await SharedPreferences.getInstance();

      final token = responseData['token'];
      preferences.setString('token', token);

      print('Token is saved to preferences: $token');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyPages()));
      print('Login successful: $responseData');
    } else {
      // Handle login failure
      print('Login failed with status code ${response.statusCode}: ${response.body}');
      // You might want to show a message to the user indicating login failure
      // Example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

}