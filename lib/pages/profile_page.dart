import 'package:ecommerce_ulab/utils/color.dart';
import 'package:ecommerce_ulab/utils/strings.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile_page';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: greyShade2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.28,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_image/Doodle - 1 (1).png',),
                  fit: BoxFit.cover
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Strings.profilePageText1,style: TextStyle(fontSize: screenHeight / 30,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: screenHeight / 30,),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 20,),
                      CircleAvatar(
                        radius: screenHeight / 20,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(width: screenWidth / 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('My name',style: TextStyle(fontSize: screenHeight / 40,color: Colors.white),),
                          Text('+ 998 99 123 45 67',style: TextStyle(fontSize: screenHeight / 40,color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
            SizedBox(height: screenHeight / 30,),
            Container(
              margin: EdgeInsets.only(right: screenWidth / 50,left: screenWidth / 50),
              height: screenHeight / 3.2,
              width: screenHeight / 2.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading:  Icon(Icons.shopping_cart_outlined,color:blue,),
                    title: Text(Strings.profilePageText3,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                  Divider(indent: screenWidth / 8,color: greyShade2,),
                  ListTile(
                    leading:  Icon(Icons.tag_faces,color:blue,),
                    title: Text(Strings.profilePageText4,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                  Divider(indent: screenWidth / 8,color: greyShade2),
                  ListTile(
                    leading:  Icon(Icons.credit_card_outlined,color:blue,),
                    title: Text(Strings.profilePageText5,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight / 50,),
            Container(
              margin: EdgeInsets.only(right: screenWidth / 50,left: screenWidth / 50),
              height: screenHeight / 2,
              width: screenHeight / 2.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.percent,color: blue,),
                    title: Text(Strings.profilePageText6,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                  Divider(indent: screenWidth / 8,color: greyShade2,),
                  ListTile(
                    leading: Icon(Icons.chat_bubble_outline_outlined,color: blue,),
                    title: Text(Strings.profilePageText7,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                  Divider(indent: screenWidth / 8,color: greyShade2,),
                  ListTile(
                    leading: Icon(Icons.notifications_none_outlined,color: blue,),
                    title: Text(Strings.profilePageText8,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                  Divider(indent: screenWidth / 8,color: greyShade2,),
                  ListTile(
                    leading: Icon(Icons.person_outline_outlined,color: blue,),
                    title: Text(Strings.profilePageText9,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                  Divider(indent: screenWidth / 8,color: greyShade2,),
                  ListTile(
                    leading: Icon(Icons.settings_outlined,color: blue,),
                    title: Text(Strings.profilePageText10,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 50,),
            Container(
                margin: EdgeInsets.only(right: screenWidth / 50,left: screenWidth / 50),
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
                      SizedBox(width: screenWidth / 30,),
                      CircleAvatar(backgroundImage: AssetImage('assets/images/profile_image/Group (1).png')),
                      SizedBox(width: screenWidth / 20,),
                      Text(Strings.profilePageText11,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Text(Strings.profilePageText16,style: TextStyle(fontSize: screenHeight / 40,color: grey,fontWeight: FontWeight.w500),),
                      Icon(Icons.navigate_next,color: black,),
                      SizedBox(width: screenWidth / 18,),
                    ],
                  ),
                ],
              )
            ),
            SizedBox(height: screenHeight / 50,),
            Container(
              margin: EdgeInsets.only(right: screenWidth / 50,left: screenWidth / 50),
              height: screenHeight / 5,
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
                      Icon(Icons.location_on_outlined,color: blue,),
                      SizedBox(width: screenWidth / 20,),
                      Text(Strings.profilePageText12,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Text(Strings.profilePageText17,style: TextStyle(fontSize: screenHeight / 40,color: grey,fontWeight: FontWeight.w500),),
                      Icon(Icons.navigate_next,color: black,),
                      SizedBox(width: screenWidth / 18,),
                    ],
                  ),
                  SizedBox(height: screenHeight / 50,),
                  Divider(indent: screenWidth / 8,color: greyShade2,),
                  ListTile(
                    leading: Icon(Icons.map_outlined,color: blue,),
                    title: Text(Strings.profilePageText13,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 50,),
            Container(
              margin: EdgeInsets.only(right: screenWidth / 50,left: screenWidth / 50),
              height: screenHeight / 5,
              width: screenHeight / 2.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.help_outline_outlined,color: blue,),
                    title: Text(Strings.profilePageText14,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                  Divider(indent: screenWidth / 8,color: greyShade2,),
                  ListTile(
                    leading: Icon(Icons.email_outlined,color: blue,),
                    title: Text(Strings.profilePageText15,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
                    trailing: Icon(Icons.navigate_next,color: black,),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 30,),
          ],
        ),
      ),
    );
  }
}
