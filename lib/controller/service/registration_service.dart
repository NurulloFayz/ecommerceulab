import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

class RegistrationService {
  static const String apiUrl = 'https://ulab-market-backend.onrender.com/auth/register';

  Future<bool> registerUser(UserModel user) async {
    final url = Uri.parse(apiUrl);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      // Handle successful registration (e.g., extract token)
      Map<String,dynamic> responseData =  jsonDecode(response.body);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      try{
          final token = responseData['token'];
          preferences.setString('token', token);

      }catch(e){}

      return true;
    } else {
      // Handle registration failure
      return false;
    }
  }
}
