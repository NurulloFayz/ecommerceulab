import 'package:ecommerce_ulab/constants/common_functions.dart';
import 'package:ecommerce_ulab/controller/service/product_service.dart';
import 'package:ecommerce_ulab/model/product_api.dart';
import 'package:ecommerce_ulab/model/product_model.dart';
import 'package:ecommerce_ulab/pages/buy_product_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:ecommerce_ulab/views/view_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../controller/provider/product_provider.dart';
import '../utils/strings.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewHomePage view = ViewHomePage();
  Future<List<Product>>? recipe ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recipe = ProductApi.getRecipe();

  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // return SafeArea(
    //   child: FutureBuilder<List<Product>>(
    //     future: products,
    //     builder: (context,snapshot){
    //       if(snapshot.hasData){
    //         return Scaffold(
    //             body: ChangeNotifierProvider(
    //               create: (context) => view,
    //               child:
    //               Consumer<ViewHomePage>(
    //                 builder: (context, view, index) {
    //                   return SingleChildScrollView(
    //                     child: Container(
    //                       padding: EdgeInsets.only(right: width / 40, left: width / 40),
    //                       width: width,
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           SizedBox(
    //                             height: height / 20,
    //                           ),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                             children: [
    //                               Container(
    //                                 width: width * .8,
    //                                 child: TextField(
    //                                   onChanged: (value) {},
    //                                   style: TextStyle(fontSize: height / 40),
    //                                   decoration: InputDecoration(
    //                                       prefixIcon: Icon(
    //                                         Icons.search,
    //                                         color: Colors.grey,
    //                                       ),
    //                                       contentPadding: EdgeInsets.all(
    //                                           MediaQuery.of(context).size.height / 60),
    //                                       filled: true,
    //                                       fillColor: Colors.grey.withOpacity(0.2),
    //                                       hintText: Strings.homePageHintText,
    //                                       hintStyle: TextStyle(
    //                                           fontSize:
    //                                           MediaQuery.of(context).size.height / 45,
    //                                           color: Colors.grey.withOpacity(0.8)),
    //                                       border: OutlineInputBorder(
    //                                           borderSide: BorderSide.none,
    //                                           borderRadius: BorderRadius.circular(8))),
    //                                 ),
    //                               ),
    //                               IconButton(
    //                                 onPressed: () {
    //                                   view.navigateToFavouritePage(context);
    //                                 },
    //                                 icon: Icon(
    //                                   Icons.favorite_border,
    //                                   color: grey,
    //                                   size: width*.09,
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             height: height / 40,
    //                           ),
    //                           Text(
    //                             Strings.category,
    //                             style: TextStyle(
    //                                 fontSize: height * .03, fontWeight: FontWeight.bold),
    //                           ),
    //                           SizedBox(
    //                             height: height * .15,
    //                             child: ListView.builder(
    //                               physics: PageScrollPhysics(),
    //                               shrinkWrap: true,
    //                               scrollDirection: Axis.horizontal,
    //                               itemCount: 10,
    //                               itemBuilder: (context, index) {
    //                                 return Padding(
    //                                   padding: EdgeInsets.all(width * .02),
    //                                   child: Column(
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         width: width * .2,
    //                                         height: width * .2,
    //                                         child: Image.asset(
    //                                           'assets/images/home_page/sale.png',
    //                                           fit: BoxFit.cover,
    //                                         ),
    //                                       ),
    //                                       Text(
    //                                         Strings.text1,
    //                                         style: TextStyle(
    //                                             fontSize: height * .015,
    //                                             fontWeight: FontWeight.bold),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: height * .2,
    //                             child: ListView.builder(
    //                               physics: PageScrollPhysics(),
    //                               shrinkWrap: true,
    //                               scrollDirection: Axis.horizontal,
    //                               itemCount: 10,
    //                               itemBuilder: (context, index) {
    //                                 return Padding(
    //                                   padding: EdgeInsets.all(width * .02),
    //                                   child: Container(
    //                                     width: width * .8,
    //                                     decoration: BoxDecoration(
    //                                       borderRadius: BorderRadius.circular(5),
    //                                     ),
    //                                     child: Image.asset(
    //                                       'assets/images/home_page/banner1.png',
    //                                       fit: BoxFit.cover,
    //                                     ),
    //                                   ),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: height * .2,
    //                             child: ListView.builder(
    //                               physics: PageScrollPhysics(),
    //                               shrinkWrap: true,
    //                               scrollDirection: Axis.horizontal,
    //                               itemCount: 10,
    //                               itemBuilder: (context, index) {
    //                                 return Padding(
    //                                   padding: EdgeInsets.all(width * .02),
    //                                   child: Stack(
    //                                     children: [
    //                                       Container(
    //                                         width: width * .24,
    //                                         height: width * .3,
    //                                         decoration: BoxDecoration(
    //                                           border: Border.all(color: blue, width: 3),
    //                                           borderRadius: BorderRadius.circular(10),
    //                                         ),
    //                                         child: Image.asset(
    //                                           'assets/images/home_page/ad.png',
    //                                           fit: BoxFit.cover,
    //                                         ),
    //                                       ),
    //                                       Positioned(
    //                                         bottom: width * .1,
    //                                         left: width * .01,
    //                                         child: Text(
    //                                           maxLines: 5,
    //                                           "Сезон покупок: что купить весной нового ",
    //                                           style: TextStyle(color: white),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                           Text(
    //                             Strings.recommend,
    //                             style: TextStyle(
    //                                 fontSize: height * .03, fontWeight: FontWeight.bold),
    //                           ),
    //                           SizedBox(
    //                             height: height / 40,
    //                           ),
    //                           GridView.builder(
    //                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                               crossAxisCount: 2,
    //                               childAspectRatio: .5,
    //                               crossAxisSpacing: width * .05,
    //                               mainAxisSpacing: width * .05,
    //                             ),
    //                             physics: PageScrollPhysics(),
    //                             shrinkWrap: true,
    //                             itemCount: 4,
    //                             itemBuilder: (context, index) {
    //                               return GestureDetector(
    //                                 onTap: () {
    //                                   Navigator.push(
    //                                     context,
    //                                     MaterialPageRoute(
    //                                       builder: (context) => BuyProductPage(),
    //                                     ),
    //                                   );
    //                                 },
    //                                 child: Container(
    //                                   width: width,
    //                                   height: height * .6,
    //                                   child: Column(
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         width: width * .42,
    //                                         height: width * .47,
    //                                         clipBehavior: Clip.antiAlias,
    //                                         decoration: BoxDecoration(
    //                                           borderRadius: BorderRadius.circular(15),
    //                                         ),
    //                                         child: Image.asset(
    //                                           'assets/images/home_page/recommend.png',
    //                                           fit: BoxFit.cover,
    //                                         ),
    //                                       ),
    //                                       CommonFunctions.blankSpace(height * .01, 0),
    //                                       SizedBox(
    //                                         width: width * .4,
    //                                         child: Text(
    //                                           overflow: TextOverflow.fade,
    //                                           maxLines: 2,
    //                                           "SmartPhone Techno Pop 5 LTE'' HD+, 2/32 GB",
    //                                           style: TextStyle(
    //                                             fontWeight: FontWeight.bold,
    //                                             fontSize: height * .022,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       Container(
    //                                         width: width * .4,
    //                                         child: Row(
    //                                           children: [
    //                                             Icon(Icons.star, color: amber),
    //                                             Text(
    //                                               '5.0 (80 заказов)',
    //                                               style: TextStyle(
    //                                                 color: grey,
    //                                                 fontSize: height * .018,
    //                                               ),
    //                                             )
    //                                           ],
    //                                         ),
    //                                       ),
    //                                       Container(
    //                                         height: height * .04,
    //                                         alignment: Alignment.center,
    //                                         decoration: BoxDecoration(
    //                                             color: Colors.yellow,
    //                                             borderRadius: BorderRadius.circular(5)),
    //                                         width: width * .34,
    //                                         child: Text(
    //                                           '109 378 sum/month',
    //                                           style: TextStyle(
    //                                             fontWeight: FontWeight.bold,
    //                                             fontSize: height * .016,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       Text(
    //                                         '1 400 000 sum',
    //                                         style: TextStyle(
    //                                           decoration: TextDecoration.lineThrough,
    //                                           color: grey,
    //                                           fontSize: height * .015,
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         width: width * .4,
    //                                         child: Row(
    //                                           mainAxisAlignment:
    //                                           MainAxisAlignment.spaceBetween,
    //                                           children: [
    //                                             Text(
    //                                               '899 000 sum',
    //                                               style: TextStyle(
    //                                                 fontWeight: FontWeight.bold,
    //                                                 fontSize: height * .02,
    //                                               ),
    //                                             ),
    //                                             Icon(Icons.shopping_bag_outlined)
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               );
    //                             },
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ));
    //       }else if(snapshot.hasError){
    //         return Center(child: Text('error: ${snapshot.error}'),);
    //       }else{
    //         return CircularProgressIndicator();
    //       }
    //     },
    //   ),
    // );

    /// -------------------------------------------------
    /// -------------------------------------------------
    /// -------------------------------------------------
    /// -------------------------------------------------



    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => view,
        child: Consumer<ViewHomePage>(
          builder: (context, view, index) {
              return  SingleChildScrollView(
                child: Container(
                  height: height,
                  child: Column(
                    children: [
                      SizedBox(height: height / 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * .8,
                            child: TextField(
                              onChanged: (value) {},
                              style: TextStyle(fontSize: height / 40),
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
                          IconButton(
                            onPressed: () {
                              view.navigateToFavouritePage(context);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: grey,
                              size: width*.09,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height / 40,),
                      ListTile(
                        title: Text(Strings.category,
                          style: TextStyle(fontSize: height * .03,
                              fontWeight: FontWeight.bold),
                        ),
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
                      Expanded(
                        child: Container(
                          child: FutureBuilder<List<Product>>(
                              future: recipe,
                              builder: (context,snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator(),);
                                } else if(snapshot.hasError) {
                                  return Center(child: Text('error${snapshot.error}'),);
                                } else {
                                  final recipes = snapshot.data;
                                  if(recipes!.isEmpty) {
                                    return Text('no recipes found');
                                  }
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                      itemCount: recipes.length,
                                      itemBuilder: (context,index) {
                                        final recipe = recipes[index];
                                        return Column(
                                          children: [
                                            Text('products - ${recipe.name}'),
                                            Text('Izoh - ${recipe.description}'),
                                          ],
                                        );
                                      }
                                  );
                                }
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          },
        ),
      )
    );
  }
}
