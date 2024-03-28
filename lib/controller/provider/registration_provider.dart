// import 'package:ecommerce_ulab/controller/service/registration_service.dart';
// import 'package:flutter/material.dart';
//
// import '../../model/user_model.dart';
// import '../../pages/auth_pages/enter_email_code_page.dart';
// class RegistrationProvider with ChangeNotifier {
//   final _emailController = TextEditingController();
//   String get email => _emailController.text;
//
//   final _nameController = TextEditingController();
//   String get name => _nameController.text;
//
//   final _phoneNumberController = TextEditingController();
//   String get phoneNumber => _phoneNumberController.text;
//
//   final RegistrationService _service;
//
//   RegistrationProvider(this._service);
//
//   void navigateToEmailCodePage(BuildContext context) {
//     final user = UserModel(
//       email: email,
//       name: name,
//       phoneNumber: phoneNumber,
//     );
//     // Trigger registration using service
//     _service.registerUser(user).then((success) {
//       if (success) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => EnterEmailCodePage(email)),
//         );
//       } else {
//         // Handle registration failure (show error message)
//       }
//     });
//   }
// }