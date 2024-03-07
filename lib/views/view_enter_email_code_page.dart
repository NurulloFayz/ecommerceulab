


import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewEnterEmailCodePage extends ChangeNotifier{
  String? sent_email;
  void focusScope(BuildContext context) {
    FocusScope.of(context).nextFocus();
    notifyListeners();
  }
  var code = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  String typedText = '';
  changeValue(value) {
    typedText = value;
    notifyListeners();
  }
  backToEmailPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, EmailPage.id);
  }
  void navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
  }
}