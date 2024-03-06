import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:ecommerce_ulab/views/view_enter_number_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/strings.dart';


class EnterNumberPage extends StatefulWidget {
  static const String id = 'enter_number_page';
  const EnterNumberPage({super.key});

  @override
  State<EnterNumberPage> createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  ViewEnterNumberPage view = ViewEnterNumberPage();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(view.textFieldFocusNode);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.navigate_before),
        ),
      ),
      body:ChangeNotifierProvider(
        create: (context) => view,
        child: Consumer<ViewEnterNumberPage>(
          builder: (context,view,index) {
           return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Strings.authText1,style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.height/27
                          ),),
                          SizedBox(height: MediaQuery.of(context).size.height/50,),
                          Text(Strings.authText2,style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.height/50,color: black38
                          ),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/40,),
                      Container(
                        height: MediaQuery.of(context).size.height/14,
                        width: MediaQuery.of(context).size.width/2.50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CountryCodePicker(
                              initialSelection: 'UZ',
                              showCountryOnly: false,
                              textStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/45,
                                  color: Colors.black,fontWeight: FontWeight.w400
                              ),
                            ),
                            Image.asset('assets/images/auth_icon/arrow-down-sign-to-navigate (1).png',height: MediaQuery.of(context).size.height/52,)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/50,left: MediaQuery.of(context).size.width/50),
                          child: TextField(
                            controller: view.number,
                            onChanged: (value) {
                              view.changeValue(value);
                            },
                            focusNode: view.textFieldFocusNode,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height/60),
                                hintText: '00 000 00 00',
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.2),
                                hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/40,
                                    color: Colors.grey,fontWeight: FontWeight.w400
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                     if(view.typedText.isEmpty) {
                       return;
                     } else {
                       view.navigateToCodePage(context);
                       view.passNumber(context, view.typedText);
                     }
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
                  // Container(
                  //   margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/50,left:MediaQuery.of(context).size.width/50 ),
                  //     child: Text(Strings.authText3,style: TextStyle(fontSize: MediaQuery.of(context).size.height/50),)
                  // )
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
