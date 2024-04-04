import 'package:ecommerce_ulab/controller/service/category_api.dart';
import 'package:ecommerce_ulab/views/view_catalog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/category_model.dart';
import '../utils/color.dart';
import '../utils/strings.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  ViewCatalogPage view = ViewCatalogPage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view.lists = CategoryApi.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: screenHeight / 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // IconButton(
              //   icon: Icon(
              //     CupertinoIcons.left_chevron,
              //     color: black,
              //     size: screenHeight / 40,
              //   ),
              //   onPressed: () {
              //     view.navigateToMyPages(context);
              //   },
              // ),
              Container(
                width: screenWidth / 1.1,
                child: TextField(
                  style: TextStyle(fontSize: screenHeight / 40),
                  controller: view.searchController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 60),
                      filled: true,
                      fillColor:view.color,
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
            height: screenHeight * .01,
          ),
          Divider(
            color: greyShade1,
            height: screenHeight * .01,
            thickness: screenHeight * .005,
          ),
          Expanded(
            child: FutureBuilder<List<CategoryModel>>(
                future: view.lists,
                builder: (context,snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  } else if(snapshot.hasError) {
                    return Center(child: Text('error${snapshot.error}'),);
                  } else {
                    final categoryList = snapshot.data;
                    if(categoryList!.isEmpty) {
                      return Text('no recipes found');
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categoryList.length,
                        itemBuilder: (context,index) {
                          final itemList = categoryList[index];
                          return Column(
                            children: [
                              SizedBox(height: screenHeight / 100,),
                              ListTile(
                                leading: Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: screenWidth / 6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.withOpacity(0.4),
                                  ),
                                  child: Image(image: NetworkImage(itemList.image),),
                                ),
                                title: Text(itemList.name,style: TextStyle(fontSize: screenHeight / 45),),
                                trailing: const Icon(Icons.navigate_next,color: Colors.grey,),
                              ),
                              SizedBox(height: screenHeight / 100,),
                              Divider(
                                thickness: 1,
                                indent: screenWidth / 20,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ],
                          );
                        }
                    );
                  }
                }
            ),
          ),
        ],
      ),
      // SingleChildScrollView(
      //   child: Container(
      //     width: width,
      //     height: height,
      //     child: Column(
      //       children: [
      //         CommonFunctions.blankSpace(height * .01, 0),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             IconButton(
      //               icon: Icon(
      //                 CupertinoIcons.left_chevron,
      //                 color: black,
      //                 size: height / 40,
      //               ),
      //               onPressed: () {
      //                 view.navigateToMyPages(context);
      //               },
      //             ),
      //             SizedBox(
      //               width: width * .82,
      //               child: TextField(
      //                 style: TextStyle(fontSize: height / 40),
      //                 controller: view.searchController,
      //                 decoration: InputDecoration(
      //                     prefixIcon: Icon(
      //                       Icons.search,
      //                       color: Colors.grey,
      //                     ),
      //                     contentPadding: EdgeInsets.all(
      //                         MediaQuery.of(context).size.height / 60),
      //                     filled: true,
      //                     fillColor:view.color,
      //                     hintText: Strings.homePageHintText,
      //                     hintStyle: TextStyle(
      //                         fontSize:
      //                             MediaQuery.of(context).size.height / 45,
      //                         color: Colors.grey.withOpacity(0.8)),
      //                     border: OutlineInputBorder(
      //                         borderSide: BorderSide.none,
      //                         borderRadius: BorderRadius.circular(8))),
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: height * .01,
      //         ),
      //         Divider(
      //           color: greyShade1,
      //           height: height * .01,
      //           thickness: height * .005,
      //         ),
      //         Container(
      //           padding: EdgeInsets.symmetric(horizontal: width * .04),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 Strings.catalogText1,
      //                 style: TextStyle(
      //                   fontSize: height / 40,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Text(
      //                   Strings.catalogText2,
      //                   style: TextStyle(color: grey, fontSize: height / 38,),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: height * .015,
      //         ),
      //         Container(
      //           padding: EdgeInsets.symmetric(horizontal: width * .04),
      //           child: ListView.builder(
      //             itemCount: 3,
      //             shrinkWrap: true,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 decoration: BoxDecoration(
      //                   border: Border(
      //                     bottom: BorderSide(color: greyShade3),
      //                   ),
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text('Мужская футболка',style: TextStyle(fontSize: height / 45,color: Colors.grey,fontWeight: FontWeight.w500),),
      //                     IconButton(
      //                         onPressed: () {},
      //                         icon: Icon(
      //                           Icons.close,
      //                           color: grey,
      //                         ))
      //                   ],
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //         SizedBox(
      //           height: height * .04,
      //         ),
      //         Container(
      //           padding: EdgeInsets.symmetric(horizontal: width * .04),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 Strings.catalogText3,
      //                 style: TextStyle(
      //                   fontSize: height / 40,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Container(
      //           padding: EdgeInsets.symmetric(horizontal: width * .04),
      //           child: ListView.builder(
      //             itemCount: 3,
      //             shrinkWrap: true,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 decoration: BoxDecoration(
      //                   border: Border(
      //                     bottom: BorderSide(color: greyShade3),
      //                   ),
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text('Кондиционеры',style: TextStyle(fontSize: height / 45,color: Colors.grey,fontWeight: FontWeight.w500),),
      //                     IconButton(
      //                         onPressed: () {},
      //                         icon: Icon(
      //                           Icons.close,
      //                           color: grey,
      //                         ))
      //                   ],
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(height: screenHeight / 20,),
      //       Container(
      //         height: screenHeight,
      //         margin: EdgeInsets.only(right: screenWidth / 40,left: screenWidth / 40),
      //         child: TextField(style: TextStyle(
      //             fontSize: screenHeight / 40),
      //           controller: view.searchController,
      //           decoration: InputDecoration(
      //               prefixIcon: Icon(
      //                 Icons.search,
      //                 color: Colors.grey,
      //               ),
      //               contentPadding: EdgeInsets.all(
      //                   MediaQuery.of(context).size.height / 60),
      //               filled: true,
      //               fillColor:view.color,
      //               hintText: Strings.homePageHintText,
      //               hintStyle: TextStyle(
      //                   fontSize: MediaQuery.of(context).size.height / 45,
      //                   color: Colors.grey.withOpacity(0.8)),
      //               border: OutlineInputBorder(
      //                   borderSide: BorderSide.none,
      //                   borderRadius: BorderRadius.circular(8))),
      //         ),
      //       ),
      //       SizedBox(height: screenHeight / 40,),
      //       Container(
      //         height: screenHeight / 280,
      //         width: screenWidth,
      //         color: Colors.grey.withOpacity(0.1),
      //       ),
      //       SizedBox(height: screenHeight / 40,),
      //       Expanded(
      //         child: Container(
      //           height: screenHeight / 1,
      //           child: FutureBuilder<List<CategoryModel>>(
      //               future: lists,
      //               builder: (context,snapshot) {
      //                 if(snapshot.connectionState == ConnectionState.waiting) {
      //                   return const Center(child: CircularProgressIndicator(),);
      //                 } else if(snapshot.hasError) {
      //                   return Center(child: Text('error${snapshot.error}'),);
      //                 } else {
      //                   final categoryList = snapshot.data;
      //                   if(categoryList!.isEmpty) {
      //                     return Text('no recipes found');
      //                   }
      //                   return ListView.builder(
      //                     shrinkWrap: true,
      //                       physics: const NeverScrollableScrollPhysics(),
      //                       itemCount: categoryList.length,
      //                       itemBuilder: (context,index) {
      //                         final itemList = categoryList[index];
      //                         return ListTile(
      //                           leading: Container(
      //                             height: screenHeight / 20,
      //                             width: screenWidth / 8,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(8),
      //                               color: Colors.grey.withOpacity(0.4),
      //                               image: DecorationImage(
      //                                 image: AssetImage(itemList.image,),
      //                                 fit: BoxFit.cover
      //                               )
      //                             ),
      //                           ),
      //                           title: Text(itemList.name,style: TextStyle(fontSize: screenHeight / 50),),
      //                           trailing: const Icon(Icons.navigate_next),
      //                         );
      //                       }
      //                   );
      //                 }
      //               }
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // )
    );
  }
}
