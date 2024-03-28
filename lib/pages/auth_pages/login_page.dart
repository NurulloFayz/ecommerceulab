import 'package:ecommerce_ulab/views/view_login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/strings.dart';

class LogInPage extends StatefulWidget {
  static const String id = 'login_page';
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  ViewLogInPage view = ViewLogInPage();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:ChangeNotifierProvider(
        create: (context) => view,
        child: Consumer<ViewLogInPage>(
          builder: (context,view,index) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 20,),
                  ListTile(
                    title: Text(
                      Strings.authText12,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight / 27
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 50,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 20,),
                      Text(Strings.loginPageText1, style: TextStyle(
                          fontSize: screenHeight / 40,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth / 30,
                      left: screenWidth / 30,
                      top: screenHeight / 150,
                    ),
                    child: TextField(
                      controller: view.login,
                      style: TextStyle(fontSize: screenHeight / 40),
                      onChanged: (value) {
                        view.changeValue(value);
                      },
                      //focusNode: view.textFieldFocusNode,
                      decoration: InputDecoration(
                          hintText: Strings.loginHintPageText1,
                          hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: screenHeight / 42),
                          filled: true,
                          fillColor: view.color,
                          contentPadding: EdgeInsets.all(screenHeight / 60),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  SizedBox(height: screenHeight / 25,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 20,),
                      Text(
                        Strings.authTextBDateHintText5,
                        style: TextStyle(
                            fontSize: screenHeight / 40,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth / 30,
                      left: screenWidth / 30,
                      top: screenHeight / 150,
                    ),
                    child: TextField(
                      controller: view.password,
                      style: TextStyle(fontSize: screenHeight / 40),
                      onChanged: (value) {
                        view.changeValue(value);
                      },
                      // focusNode: view.textFieldFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                          hintText: Strings.loginHintPageText2,
                          hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: screenHeight / 42),
                          filled: true,
                          fillColor: view.color,
                          suffixIcon: IconButton(
                              onPressed: () {
                                view.obscurePassword = !view.obscurePassword;
                              },
                              icon: Icon(view.obscurePassword ? Icons.visibility : Icons.visibility_off)
                          ),
                          contentPadding: EdgeInsets.all(screenHeight / 60),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (view.typedText.isEmpty) {
                        return;
                      } else {
                        //view.navigateToEnterEmailCodePage(context);
                        view.logIn(view.password.text, view.login.text, context);
                        print(view.password.text);
                        print(view.login.text);
                        //view.showEmail(context, view.email.text);
                      }
                    },
                    child: Container(
                      height: screenHeight / 12,
                      width: screenWidth / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: view.typedText.isEmpty
                            ? Colors.grey.withOpacity(0.4)
                            : buttonColor,
                      ),
                      child: Center(
                        child: Text(
                          Strings.buttonText,
                          style: TextStyle(
                              fontSize: screenHeight / 40,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 40,
                  )
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
