import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/strings.dart';
import '../../views/view_enter_email_code_page.dart';

class EnterEmailCodePage extends StatefulWidget {
  static const String id = 'enter_email_code_page';
  const EnterEmailCodePage(this.widgetEmailCode,{super.key});
  final String widgetEmailCode;

  @override
  State<EnterEmailCodePage> createState() => _EnterEmailCodePageState();
}

class _EnterEmailCodePageState extends State<EnterEmailCodePage> {
  ViewEnterEmailCodePage view = ViewEnterEmailCodePage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view.sent_email = widget.widgetEmailCode;
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              view.backToEmailPage(context);
            },
            icon: Icon(Icons.navigate_before),
          ),
        ),
        body:ChangeNotifierProvider(
          create: (context) => view,
          child: Consumer<ViewEnterEmailCodePage>(
            builder: (context,view,index) {
              return Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: screenWidth / 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.authText4,style: TextStyle(fontWeight: FontWeight.w600,
                                fontSize: screenHeight / 27
                            ),),
                            SizedBox(height:screenHeight / 50,),
                            Text(Strings.authText9,style: TextStyle(fontWeight: FontWeight.w600,
                                fontSize: screenHeight / 40,color: black38
                            ),),
                            Text(view.sent_email.toString(),style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: screenHeight / 45,color: black38,

                            ),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight / 30,),
                    Container(
                      margin: EdgeInsets.only(right: screenWidth / 30,
                        left:  screenWidth / 30,
                      ),
                      child: TextField(
                        controller: view.emailCode,
                        onChanged: (value) {
                          view.changeValue(value);
                        },
                        decoration: InputDecoration(
                            hintText: Strings.authText8,
                            fillColor: Colors.grey.withOpacity(0.2),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if(view.typedText.isEmpty) {
                          return;
                        } else {
                          view.enterPassword(view.emailCode.text,widget.widgetEmailCode,context);
                          //view.navigateToMyPages(context);
                        }
                      },
                      child: Container(
                        height: screenHeight / 12,
                        width: screenWidth / 1.1,
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