import 'package:ecommerce_ulab/utils/color.dart';
import 'package:ecommerce_ulab/utils/strings.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  static const String id = 'favourite_page';
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Text(Strings.favouritePageText,style: TextStyle(fontSize: screenHeight / 40,color: black,fontWeight: FontWeight.w500),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/fav_pageImages/Emoji.png',height: screenHeight / 6,),
            Text(Strings.emptyWarningText1,style: TextStyle(fontSize: screenHeight / 30,color: black,
            fontWeight: FontWeight.bold
            ),),
            Text(Strings.emptyWarningText2,style: TextStyle(fontSize: screenHeight / 40,color: grey,fontWeight: FontWeight.w400),),
            Text(Strings.emptyWarningText3,style: TextStyle(fontSize: screenHeight / 40,color: grey,fontWeight: FontWeight.w400),),
          ],
        ),
      ),
    );
  }
}
