import 'package:ecommerce_ulab/constants/common_functions.dart';
import 'package:ecommerce_ulab/views/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../utils/color.dart';
import '../utils/strings.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                CommonFunctions.blankSpace(height * .01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.left_chevron,
                        color: black,
                        size: height / 40,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: width * .82,
                      child: TextField(
                        style: TextStyle(fontSize: height / 40),
                        controller: searchController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height / 60),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            hintText: Strings.homePageHintText,
                            hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                                color: Colors.grey.withOpacity(0.8)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Divider(
                  color: greyShade1,
                  height: height * .01,
                  thickness: height * .005,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.catalogText1,
                        style: TextStyle(
                          fontSize: height / 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          Strings.catalogText2,
                          style: TextStyle(color: grey, fontSize: height / 38,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .015,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: greyShade3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Мужская футболка',style: TextStyle(fontSize: height / 45,color: Colors.grey,fontWeight: FontWeight.w500),),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.close,
                                  color: grey,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.catalogText3,
                        style: TextStyle(
                          fontSize: height / 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: greyShade3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Кондиционеры',style: TextStyle(fontSize: height / 45,color: Colors.grey,fontWeight: FontWeight.w500),),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.close,
                                  color: grey,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
