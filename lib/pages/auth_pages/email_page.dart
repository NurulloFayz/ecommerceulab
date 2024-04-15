import 'package:ecommerce_ulab/views/view_email_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/strings.dart';

class EmailPage extends StatefulWidget {
  static const String id = 'email_page';

  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ViewEmailPage view = ViewEmailPage();
    return Scaffold(
      backgroundColor: white,
        body: ChangeNotifierProvider(
          create: (context) => view,
          child: Consumer<ViewEmailPage>(
            builder: (context, view, index) {
              return SingleChildScrollView(
                reverse: true,
                physics: ClampingScrollPhysics(),
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight / 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              Strings.authText7,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenHeight / 27),
                            ),
                          )
                          // Container(
                          //   margin:
                          //       EdgeInsets.only(right: screenWidth / 50),
                          //   child: Text(
                          //     Strings.authText2,
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: screenHeight / 50,
                          //         color: Colors.grey),
                          //   ),
                          // ),
                        ],
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height / 30,
                      // ),
                      SizedBox(height: screenHeight / 50,),
                      Row(
                        children: [
                          SizedBox(width: screenWidth / 20,),
                          Text(Strings.authTextBDateHintText3, style: TextStyle(
                              fontSize: screenHeight / 40,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      //email
                      Container(
                        margin: EdgeInsets.only(
                          right: screenWidth / 30,
                          left: screenWidth / 30,
                          top: screenHeight / 150,
                        ),
                        child: TextField(
                          controller: view.email,
                          style: TextStyle(fontSize: screenHeight / 40),
                          onChanged: (value) {
                            view.changeValue(value);
                          },
                          //focusNode: view.textFieldFocusNode,
                          decoration: InputDecoration(
                              hintText: Strings.authTextBDateHintText1,
                              hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: screenHeight / 42),
                              filled: true,
                              fillColor: view.color,
                              contentPadding: EdgeInsets.all(screenHeight / 60),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      // SizedBox(height: screenHeight / 25,),
                      // Row(
                      //   children: [
                      //     SizedBox(width: screenWidth / 20,),
                      //     Text(
                      //       Strings.authTextBDateHintText4,
                      //       style: TextStyle(
                      //           fontSize: screenHeight / 40,fontWeight: FontWeight.w400),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     right: screenWidth / 30,
                      //     left: screenWidth / 30,
                      //     top: screenHeight / 150,
                      //   ),
                      //   child: TextField(
                      //     controller: view.name,
                      //     style: TextStyle(fontSize: screenHeight / 40),
                      //     onChanged: (value) {
                      //       view.changeValue(value);
                      //     },
                      //     // focusNode: view.textFieldFocusNode,
                      //     decoration: InputDecoration(
                      //         hintText: Strings.authTextBDateHintText2,
                      //         hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: screenHeight / 42),
                      //         filled: true,
                      //         fillColor: view.color,
                      //         contentPadding: EdgeInsets.all(screenHeight / 60),
                      //         border: OutlineInputBorder(
                      //           borderSide: BorderSide.none,
                      //             borderRadius: BorderRadius.circular(8))),
                      //   ),
                      // ),
                      // SizedBox(height: screenHeight / 25,),
                      // Row(
                      //   children: [
                      //     SizedBox(width: screenWidth / 20,),
                      //     Text(
                      //       Strings.authTextBPhoneNumber,
                      //       style: TextStyle(
                      //           fontSize: screenHeight / 40,fontWeight: FontWeight.w400),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     right: screenWidth / 30,
                      //     left: screenWidth / 30,
                      //     top: screenHeight / 150,
                      //   ),
                      //   child: TextField(
                      //     controller: view.email,
                      //     style: TextStyle(fontSize: screenHeight / 40),
                      //     onChanged: (value) {
                      //       view.changeValue(value);
                      //     },
                      //     // focusNode: view.textFieldFocusNode,
                      //     decoration: InputDecoration(
                      //         hintText: Strings.authTextBPhoneNumber6,
                      //         hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: screenHeight / 42),
                      //         filled: true,
                      //         fillColor:view.color,
                      //         contentPadding: EdgeInsets.all(screenHeight / 60),
                      //         border: OutlineInputBorder(
                      //           borderSide: BorderSide.none,
                      //             borderRadius: BorderRadius.circular(8))),
                      //   ),
                      // ),
                      // SizedBox(height: screenHeight / 25,),
                      // Row(
                      //   children: [
                      //     SizedBox(width: screenWidth / 20,),
                      //     Text(
                      //       Strings.authTextBDateHintText5,
                      //       style: TextStyle(
                      //           fontSize: screenHeight / 40,fontWeight: FontWeight.w400),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     right: screenWidth / 30,
                      //     left: screenWidth / 30,
                      //     top: screenHeight / 150,
                      //   ),
                      //   child: TextField(
                      //     controller: view.password,
                      //     style: TextStyle(fontSize: screenHeight / 40),
                      //     onChanged: (value) {
                      //       view.changeValue(value);
                      //     },
                      //     // focusNode: view.textFieldFocusNode,
                      //     decoration: InputDecoration(
                      //         hintText: Strings.authTextBDateHintText6,
                      //         hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: screenHeight / 42),
                      //         filled: true,
                      //         fillColor: view.color,
                      //         contentPadding: EdgeInsets.all(screenHeight / 60),
                      //         border: OutlineInputBorder(
                      //             borderSide: BorderSide.none,
                      //             borderRadius: BorderRadius.circular(8))),
                      //   ),
                      // ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (view.typedText.isEmpty) {
                            return;
                          } else {
                            //view.navigateToEnterEmailCodePage(context);
                            view.loginUser();
                            view.showEmail(context, view.email.text);
                            print(view.email.text);
                            print(view.phoneNumber.text);
                            print(view.name.text);
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
                ),
              );
            },
          ),
        ));
  }
}
