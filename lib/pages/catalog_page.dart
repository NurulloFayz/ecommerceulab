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
  late Future<List<CategoryModel>> categoriesFuture;
  List<CategoryModel> filteredCategories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view.lists = CategoryService.fetchCategories();
    categoriesFuture = CategoryService.fetchCategories();
  }
  void searchCategories(String query) {
    if (query.length > 0) {
      view.lists?.then((categories) {
        setState(() {
          filteredCategories.clear();

          for (var category in categories) {
            if (category.nameUz.toLowerCase().startsWith(query.toLowerCase())) {
              filteredCategories.add(category);
            }
          }
        });
      });
    } else {
      setState(() {
        filteredCategories.clear();
      });
    }
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
              Container(
                width: screenWidth / 1.1,
                child: TextField(
                  style: TextStyle(fontSize: screenHeight / 40),
                  controller: view.searchController,
                  onChanged: searchCategories,
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
                future: categoriesFuture,
                builder: (context,snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  } else if(snapshot.hasError) {
                    return Center(child: Text('error${snapshot.error}'),);
                  } else {
                    final categoryList = snapshot.data;
                    if (categoryList!.isEmpty) {
                      return const Text('No categories found');
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredCategories.isNotEmpty
                            ? filteredCategories.length
                            : categoryList.length,
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
                                      color: Colors.grey.withOpacity(0.2),
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
