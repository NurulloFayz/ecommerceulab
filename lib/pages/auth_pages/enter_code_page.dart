import 'package:ecommerce_ulab/views/view_enter_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/strings.dart';

class EnterCodePage extends StatefulWidget {
  static const String id = 'enter_code_page';
  const EnterCodePage(this.number,{super.key});
  final String number;

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  ViewEnterCodePage view = ViewEnterCodePage();
  String? code_number;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    code_number = widget.number;
  }
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(view.textFieldFocusNode);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            view.backNumberPage(context);
          },
          icon: Icon(Icons.navigate_before),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => view,
        child: Consumer<ViewEnterCodePage> (
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
                          Text(Strings.authText4,style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.height/27
                          ),),
                          Text(Strings.authText5+'+998 ${code_number}',style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.height/50,color: Colors.grey
                          ),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width/30,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/7,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              view.changeValue(value);
                              if(value.length == 1) {
                                view.focusScope(context);
                              }
                            },
                            focusNode: view.textFieldFocusNode,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/7,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if(value.length == 1) {
                                view.focusScope(context);
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/7,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if(value.length == 1) {
                                view.focusScope(context);
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/7,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if(value.length == 1) {
                                view.focusScope(context);
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.width/7,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if(value.length == 1) {
                                view.focusScope(context);
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/30,),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {

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
