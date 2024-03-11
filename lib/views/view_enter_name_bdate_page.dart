

import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewEnterNameBDatePage extends ChangeNotifier{
  var name = TextEditingController();
  var birthDate = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  String typedText = '';
  changeValue(value) {
    typedText = value;
    notifyListeners();
  }
  void navigateToMyPages(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyPages()));
  }
}