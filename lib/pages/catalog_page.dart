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
    view.lists = CategoryService.fetchCategories();
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
                                  child: Image(image: NetworkImage(itemList.image??''),),
                                ),
                                title: Text(itemList.nameUz,style: TextStyle(fontSize: screenHeight / 45),),
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
    );
  }
}
