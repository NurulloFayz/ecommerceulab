import 'package:ecommerce_ulab/utils/color.dart';
import 'package:ecommerce_ulab/utils/strings.dart';
import 'package:ecommerce_ulab/views/view_profile_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile_page';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ViewProfilePage view = ViewProfilePage();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double figmaHeight = 203.0;
    return Scaffold(
      backgroundColor:view.color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height:figmaHeight * (screenHeight / 812),
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/profile_image/Doodle - 1 (1).png',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.profilePageText1,
                        style: TextStyle(
                            fontSize: screenHeight / 35, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 20,
                      ),
                      CircleAvatar(
                        radius: screenHeight / 20,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        width: screenWidth / 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My name',
                            style: TextStyle(
                                fontSize: screenHeight / 45,
                                color: Colors.white),
                          ),
                          Text(
                            '+ 998 99 123 45 67',
                            style: TextStyle(
                                fontSize: screenHeight / 45,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 60,
            ),
            Container(
              margin: EdgeInsets.only(
                  right: screenWidth / 50, left: screenWidth / 50),
              height: screenHeight / 4,
              width: screenHeight / 2.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight / 50,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText3,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(
                    indent: screenWidth / 8,
                    color: greyShade2,
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.tag_faces,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                            Strings.profilePageText4,
                            style: TextStyle(
                                fontSize: screenHeight / 45,
                                fontWeight: FontWeight.w500),
                          ),
                      Spacer(),
                      Icon(
                            Icons.navigate_next,
                            color: black,
                          ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(indent: screenWidth / 8, color: greyShade2),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                            Icons.credit_card_outlined,
                            color: blue,
                          ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                            Strings.profilePageText5,
                            style: TextStyle(
                                fontSize: screenHeight / 45,
                                fontWeight: FontWeight.w500),
                          ),
                      Spacer(),
                      Icon(
                            Icons.navigate_next,
                            color: black,
                          ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 50,),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 70,
            ),
            Container(
              margin: EdgeInsets.only(
                  right: screenWidth / 50, left: screenWidth / 50),
              height: screenHeight / 2.5,
              width: screenHeight / 2.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight / 50,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.percent,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText6,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(
                    indent: screenWidth / 8,
                    color: greyShade2,
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.chat_bubble_outline_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText7,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(
                    indent: screenWidth / 8,
                    color: greyShade2,
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.notifications_none_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText8,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(
                    indent: screenWidth / 8,
                    color: greyShade2,
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.person_outline_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText9,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(
                    indent: screenWidth / 8,
                    color: greyShade2,
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.settings_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText10,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 50,),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 70,
            ),
            Container(
                margin: EdgeInsets.only(
                    right: screenWidth / 50, left: screenWidth / 50),
                height: screenHeight / 11,
                width: screenHeight / 2.0,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 30,
                        ),
                        CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/profile_image/Group (1).png')),
                        SizedBox(
                          width: screenWidth / 20,
                        ),
                        Text(
                          Strings.profilePageText11,
                          style: TextStyle(
                              fontSize: screenHeight / 45,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          Strings.profilePageText16,
                          style: TextStyle(
                              fontSize: screenHeight / 45,
                              color: grey,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: black,
                        ),
                        SizedBox(
                          width: screenWidth / 50,
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: screenHeight / 70,
            ),
            Container(
              margin: EdgeInsets.only(
                  right: screenWidth / 50, left: screenWidth / 50),
              height: screenHeight / 6.1,
              width: screenHeight / 2.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight / 50,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.location_on_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText12,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                              Strings.profilePageText17,
                              style: TextStyle(
                                  fontSize: screenHeight / 45,
                                  color: grey,
                                  fontWeight: FontWeight.w500),
                            ),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(
                    indent: screenWidth / 8,
                    color: greyShade2,
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.map_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText13,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 50,),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight / 70,
            ),
            Container(
              margin: EdgeInsets.only(
                  right: screenWidth / 50, left: screenWidth / 50),
              height: screenHeight / 6.4,
              width: screenHeight / 2.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight / 50,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.help_outline_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText14,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Divider(
                    indent: screenWidth / 8,
                    color: greyShade2,
                  ),
                  SizedBox(height: screenHeight / 70,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 30,),
                      Icon(
                        Icons.email_outlined,
                        color: blue,
                      ),
                      SizedBox(width: screenWidth / 50,),
                      Text(
                        Strings.profilePageText15,
                        style: TextStyle(
                            fontSize: screenHeight / 45,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.navigate_next,
                        color: black,
                      ),
                      SizedBox(width: screenWidth / 50,)
                    ],
                  ),
                  SizedBox(height: screenHeight / 50,),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 50,),
            Text('Версия приложения: 1.28.0 (8290)',style: TextStyle(fontSize: screenHeight / 45,color: Colors.grey),),
            SizedBox(height: screenHeight / 40,),
            // TextButton(
            //   child: Text('Выйти из аккунта ',style: TextStyle(
            //     color: Colors.blue,
            //     fontSize: 20,
            //   ),),
            //   onPressed: () async {
            //     final SharedPreferences preferences =
            //         await SharedPreferences.getInstance();
            //     preferences.remove('email');
            //     Navigator.pushReplacement(context,
            //         MaterialPageRoute(builder: (context) => OnBoardingPage()));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
