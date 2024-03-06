



import 'package:ecommerce_ulab/pages/auth_pages/enter_number_page.dart';
import 'package:flutter/widgets.dart';

class ViewEnterCodePage extends ChangeNotifier {
  var code = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  String typedText = '';
  changeValue(value) {
    typedText = value;
    notifyListeners();
  }
  backNumberPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, EnterNumberPage.id);
  }
  void focusScope(BuildContext context) {
    FocusScope.of(context).nextFocus();
    notifyListeners();
  }
}