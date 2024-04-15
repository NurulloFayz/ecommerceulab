import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
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
  // ViewEmailPage viewEmailPage = ViewEmailPage();

  FocusNode focusNode = FocusNode();

  @override
  void dispose() {

    focusNode.dispose();
    super.dispose();
  }

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
                    SizedBox(
                      height: 68,
                      child: Pinput(
                        onChanged: (value){
                          view.changeValue(value);
                        },
                        controller: view.emailCode,
                        length: 6,
                        focusNode: focusNode,
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 60,
                          textStyle: GoogleFonts.openSans().copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.transparent),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 56,
                          height: 60,
                          textStyle: GoogleFonts.openSans().copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.deepPurple),
                          ),
                        ),
                        errorPinTheme: PinTheme(
                          width: 56,
                          height: 60,
                          textStyle: GoogleFonts.openSans().copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.red),
                          ),
                        ),
                        onCompleted: (pin) {
                          setState(() {
                            view.otpCode = pin;
                          });
                        },
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () async{
                        if(view.otpCode.isEmpty) {
                          return;
                        } else {
                          view.enterPassword(view.emailCode.text,widget.widgetEmailCode,context);

                        }
                      },
                      child: Container(
                        height: screenHeight / 12,
                        width: screenWidth / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: view.otpCode.isEmpty ? Colors.grey.withOpacity(0.4) : buttonColor,
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