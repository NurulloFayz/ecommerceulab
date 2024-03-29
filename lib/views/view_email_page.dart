

import 'package:ecommerce_ulab/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../pages/auth_pages/enter_email_code_page.dart';


class ViewEmailPage extends ChangeNotifier{

  ViewEmailPage();
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

  Future<void> loginUser() async {
    final UserModel userModel = UserModel(email: email.text, name: name.text, phoneNumber: phoneNumber.text);
    var url = Uri.parse('https://ulab-market-backend.onrender.com/auth/register');

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userModel.toJson()),
    );
    final storage = FlutterSecureStorage();
    if (response.statusCode == 200) {
      // Successful login, handle response data
      Map<String,dynamic> responseData =  jsonDecode(response.body);


      print('Login successful: $responseData');
    } else {
      // Handle login failure
      print('Login failed: ${response.body}');
    }
  }

}