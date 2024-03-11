import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color.dart';
import '../../utils/strings.dart';
import '../../views/view_enter_name_bdate_page.dart';

class EnterNameBDatePage extends StatefulWidget {
  static const String id = 'enter_name_bdate_page';
  const EnterNameBDatePage({super.key});

  @override
  State<EnterNameBDatePage> createState() => _EnterNameBDatePageState();
}

class _EnterNameBDatePageState extends State<EnterNameBDatePage> {
  ViewEnterNameBDatePage view = ViewEnterNameBDatePage();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
      body:ChangeNotifierProvider(
        create: (context) => view,
        child: Consumer<ViewEnterNameBDatePage> (
          builder: (context,view,index) {
            return Column(
              children: [
                SizedBox(height: screenHeight / 40,),
                Row(
                  children: [
                    SizedBox(width:screenWidth / 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.authText7,style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: screenHeight / 27
                        ),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight / 30),
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                    left:  MediaQuery.of(context).size.width/30,
                  ),
                  child: TextField(
                    controller: view.name,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height/40),
                    onChanged: (value) {
                      view.changeValue(value);
                    },

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
                SizedBox(height: screenHeight / 50),
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                    left:  MediaQuery.of(context).size.width/30,
                  ),
                  child: TextField(
                    controller: view.birthDate,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height/40),
                    onChanged: (value) {
                      view.changeValue(value);
                    },

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
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if(view.typedText.isEmpty) {
                      return;
                    } else {
                      //view.navigateToEnterEmailCodePage(context);
                      view.navigateToMyPages(context);
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
              ],
            );
          }
        ),
      )
    );
  }
}
