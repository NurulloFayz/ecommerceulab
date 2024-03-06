import 'package:ecommerce_ulab/views/back_button.dart';
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
    //FocusScope.of(context).requestFocus(view.textFieldFocusNode);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
             backButton(context);
            },
            icon: Icon(Icons.navigate_before),
          ),
        ),
      body:ChangeNotifierProvider(
        create: (context) => view,
        child: Consumer<ViewEmailPage> (
          builder: (context,view,index) {
            return Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Strings.authText7,style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.height/27
                          ),),
                          SizedBox(height: MediaQuery.of(context).size.height/50,),
                          Text(Strings.authText2,style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.height/50,color: Colors.grey
                          ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Container(
                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                      left:  MediaQuery.of(context).size.width/30,
                    ),
                    child: TextField(
                      controller: view.email,
                      onChanged: (value) {
                        view.changeValue(value);
                      },
                      focusNode: view.textFieldFocusNode,
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
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      view.navigateToEnterEmailCodePage(context);
                      view.showEmail(context, view.typedText);

                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/12,
                      width: MediaQuery.of(context).size.width/1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: view.typedText.isEmpty ? Colors.grey.withOpacity(0.4) : buttonColor,
                      ),
                      child: Center(
                        child: Text(Strings.buttonText,style: TextStyle(fontSize: MediaQuery.of(context).size.height/40,
                            color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/40,)
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
