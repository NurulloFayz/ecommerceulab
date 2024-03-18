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
  ViewEmailPage view = ViewEmailPage();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
      body:ChangeNotifierProvider(
        create: (context) => view,
        child: Consumer<ViewEmailPage> (
          builder: (context,view,index) {
            return Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: screenWidth /40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Strings.authText7,style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize:screenHeight / 27
                          ),),
                          SizedBox(height: screenHeight / 50,),
                          Container(
                            margin: EdgeInsets.only(right:screenWidth / 50),
                            child: Text(Strings.authText2,style: TextStyle(fontWeight: FontWeight.w500,
                                fontSize: screenHeight / 50,color: Colors.grey
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Container(
                    margin: EdgeInsets.only(right: screenWidth / 30,
                      left:  screenWidth / 30,
                    ),
                    child: TextField(
                      controller: view.email,
                      style: TextStyle(fontSize: screenHeight / 40),
                      onChanged: (value) {
                        view.changeValue(value);
                      },
                      //focusNode: view.textFieldFocusNode,
                      decoration: InputDecoration(
                          hintText: 'E-mail',
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(Strings.authTextBDateHintText2,style: TextStyle(fontWeight: FontWeight.w600,
                        fontSize:screenHeight / 38
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: screenWidth / 30,
                      left:  screenWidth / 30,
                    ),
                    child: TextField(
                      controller: view.name,
                      style: TextStyle(fontSize: screenHeight / 40),
                      onChanged: (value) {
                        view.changeValue(value);
                      },
                     // focusNode: view.textFieldFocusNode,
                      decoration: InputDecoration(
                          hintText: Strings.authTextBDateHintText2,
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(Strings.authTextBDateHintText,style: TextStyle(fontWeight: FontWeight.w600,
                        fontSize:screenHeight / 38
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: screenWidth / 30,
                      left:  screenWidth / 30,
                    ),
                    child: TextField(
                      controller: view.phoneNumber,
                      style: TextStyle(fontSize: screenHeight / 40),
                      onChanged: (value) {
                        view.changeValue(value);
                      },
                     // focusNode: view.textFieldFocusNode,
                      decoration: InputDecoration(
                          hintText: Strings.authTextBDateHintText,
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                    ),
                  ),
                  // ListTile(
                  //   title: Text(Strings.authText1,style: TextStyle(fontWeight: FontWeight.w600,
                  //       fontSize:screenHeight / 38
                  //   ),),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(right: screenWidth / 30,
                  //     left:  screenWidth / 30,
                  //   ),
                  //   child: TextField(
                  //     controller: view.email,
                  //     style: TextStyle(fontSize: screenHeight / 40),
                  //     onChanged: (value) {
                  //       view.changeValue(value);
                  //     },
                  //     focusNode: view.textFieldFocusNode,
                  //     decoration: InputDecoration(
                  //         hintText: Strings.authText1,
                  //         filled: true,
                  //         fillColor: Colors.grey.withOpacity(0.2),
                  //         border: OutlineInputBorder(
                  //             borderSide: BorderSide.none,
                  //             borderRadius: BorderRadius.circular(8)
                  //         )
                  //     ),
                  //   ),
                  // ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if(view.typedText.isEmpty) {
                        return;
                      } else {
                        //view.navigateToEnterEmailCodePage(context);
                        view.loginUser(view.email.text,view.name.text,view.phoneNumber.text);
                        view.showEmail(context, view.email.text);
                        print(view.email.text);
                        print(view.phoneNumber.text);
                        print(view.name.text);
                        //view.showEmail(context, view.email.text);
                      }
                    },
                    child: Container(
                      height: screenHeight / 12,
                      width:screenWidth / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: view.typedText.isEmpty ? Colors.grey.withOpacity(0.4) : buttonColor,
                      ),
                      child: Center(
                        child: Text(Strings.buttonText,style: TextStyle(fontSize:screenHeight / 40,
                            color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 40,)
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
