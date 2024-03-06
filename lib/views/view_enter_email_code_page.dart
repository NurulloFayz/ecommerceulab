


import 'package:flutter/cupertino.dart';

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

}