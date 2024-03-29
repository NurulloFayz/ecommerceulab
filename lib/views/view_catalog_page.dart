

import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/material.dart';

class ViewCatalogPage {

  TextEditingController searchController = TextEditingController();

  void navigateToMyPages(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyPages()));
  }
  Color color = const Color(0xFFF5F6F8);
  Widget itemLists(BuildContext context,{required imageUrl, required title}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: screenWidth / 40,),
            Container(
              height: screenHeight / 15,
              width: screenWidth / 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Center(
                child: Image.asset(imageUrl,height: screenHeight / 30,),
              ),
            ),
            SizedBox(width: screenWidth / 30,),
            Text(title,style: TextStyle(fontSize: screenHeight / 45,color: black),),
            Spacer(),
            Icon(Icons.navigate_next),
            SizedBox(width: screenWidth / 20,),
          ],
        ),
        SizedBox(height: screenHeight / 100,),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.3),
          indent: screenWidth / 30,
        ),
        SizedBox(height: screenHeight / 100,),
      ],
    );
  }
}