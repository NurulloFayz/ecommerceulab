

import 'package:flutter/material.dart';

import '../pages/auth_pages/enter_email_code_page.dart';


class ViewEmailPage extends ChangeNotifier{
  var email = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  String typedText = '';
  changeValue(value) {
    typedText = value;
    notifyListeners();
  }
  void showEmail(BuildContext context,String email) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EnterEmailCodePage(email)));
  }
}