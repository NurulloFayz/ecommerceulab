import 'package:ecommerce_ulab/utils/color.dart';
import 'package:ecommerce_ulab/views/view_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/strings.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewHomePage view = ViewHomePage();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body:ChangeNotifierProvider(
          create: (context) => view,
          child: Consumer<ViewHomePage> (
            builder: (context,view,index) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(right: width / 40, left: width / 40),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height / 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * .82,
                            child: TextField(
                              style: TextStyle(fontSize: height / 40),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: EdgeInsets.all(
                                      height / 60),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  hintText: Strings.homePageHintText,
                                  hintStyle: TextStyle(
                                      fontSize: height / 45,
                                      color: Colors.grey.withOpacity(0.8)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              view.navigateToFavouritePage(context);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: grey,
                              size: height / 25,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height / 50,),
                      Text(
                        Strings.category,
                        style: TextStyle(
                            fontSize: height * .03, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * .15,
                        child: ListView.builder(
                          physics: PageScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(width * .02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * .2,
                                    height: width * .2,
                                    child: Image.asset(
                                      'assets/images/home_page/sale.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    Strings.text1,
                                    style: TextStyle(
                                        fontSize: height * .015,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * .2,
                        child: ListView.builder(
                          physics: PageScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(width * .02),
                              child: Container(
                                width: width * .8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset(
                                  'assets/images/home_page/banner1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * .2,
                        child: ListView.builder(
                          physics: PageScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(width * .02),
                              child: Stack(
                                children: [
                                  Container(
                                    width: width * .24,
                                    height: width * .3,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: blue, width: 3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/home_page/ad.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: width * .1,
                                    left: width * .01,
                                    child: Text(
                                      maxLines: 5,
                                      "Сезон покупок: что купить весной нового ",
                                      style: TextStyle(color: white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        Strings.recommend,
                        style: TextStyle(
                            fontSize: height * .03, fontWeight: FontWeight.bold),
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .8,
                          crossAxisSpacing: width * .05,
                          mainAxisSpacing: width * .05,
                        ),
                        physics: PageScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 162,
                            height: 304,
                            color: blue,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }
}
