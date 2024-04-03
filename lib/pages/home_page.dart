import 'package:ecommerce_ulab/constants/common_functions.dart';
import 'package:ecommerce_ulab/controller/service/product_service.dart';
import 'package:ecommerce_ulab/controller/service/product_api.dart';
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
  Future<List<Product>>? product ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = ProductApi.getRecipe();

  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                                      "Сезон покупок: что купить весной нового",
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
                              future: product,
                              builder: (context,snapshot) {
                                if(snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator(),);
                                } else if(snapshot.hasError) {
                                  return Center(child: Text('error${snapshot.error}'),);
                                } else {
                                  final products = snapshot.data;
                                  if(products!.isEmpty) {
                                    return Text('no recipes found');
                                  }
                                  return ListView.builder(
                                      physics: PageScrollPhysics(),
                                      itemCount: products.length,
                                      itemBuilder: (context,index) {
                                        final recipe = products[index];
                                        return Column(
                                          children: [
                                            Text('products - ${recipe.name}'),
                                            Text('Izoh - ${recipe.description}'),
                                            Image.network(recipe.mainImage)
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
