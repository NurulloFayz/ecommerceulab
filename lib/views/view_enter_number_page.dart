

import 'package:ecommerce_ulab/pages/auth_pages/enter_code_page.dart';
import 'package:flutter/material.dart';

class ViewEnterNumberPage extends ChangeNotifier {
  var number = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  String typedText = '';
  changeValue(value) {
    typedText = value;
    notifyListeners();
  }
   navigateToCodePage(BuildContext context) {
    Navigator.pushNamed(context, EnterCodePage.id);
    notifyListeners();
  }
  void passNumber(BuildContext context,String number) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EnterCodePage(number)));
  }

}