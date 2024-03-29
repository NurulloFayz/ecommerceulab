// "{
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTE0NjA4NzYsInVpZCI6IjUifQ.lZeqec6k0o68f9ZX1XMSfnJagBf6fusYmIsrKipK1w0",
//     "success": true
// }

import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/pages/auth_pages/enter_name_bdate.dart';
import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewEnterEmailCodePage extends ChangeNotifier {
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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => EnterNameBDatePage()));
  }

  void navigateToMyPages(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyPages()));
  }

  Future<void> enterPassword(
      String password, String email, BuildContext context) async {
    var url =
        Uri.parse('https://ulab-market-backend.onrender.com/auth/verifyCode');
    checkEmail = email;

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'code': password,
        'type': 'email',
        'source': email,
      }),
    );
    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', checkEmail);

      //view.navigateToMyPages(context);

      // Successful login, handle response data
      var responseData = jsonDecode(response.body);

       preferences = await SharedPreferences.getInstance();
      preferences.setString('token',responseData['token']);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyPages()));
      print('Login successful: $responseData');
    } else {
      // Handle login failure
      print('Login failed: ${response.body}');
    }
  }
}
