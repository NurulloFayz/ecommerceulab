import 'dart:async';
import 'dart:math';

import 'package:ecommerce_ulab/controller/service/product_api.dart';
import 'package:ecommerce_ulab/model/product_model.dart';
import 'package:ecommerce_ulab/pages/basket_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:ecommerce_ulab/views/view_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/service/category_api.dart';
import '../model/category_model.dart';
import '../utils/strings.dart';
import '../views/view_catalog_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _boxColor = Colors.blue;
  Timer? _timer;
  ViewHomePage view = ViewHomePage();
  ViewCatalogPage viewCatalogPage = ViewCatalogPage();

  Color _generateRandomColor() {
    // Generate a random color
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(
        milliseconds: 300,
      ),
      (timer) {
        setState(
          () {
            _boxColor = _generateRandomColor();
          },
        );
      },
    );
    super.initState();
    view.product = ProductApi.getProduct();
    viewCatalogPage.lists = CategoryService.fetchCategories();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
          return ListView(
            children: [
              SizedBox(
                height: height / 20,
              ),
              Padding(
                padding:  EdgeInsets.only(left: width*.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: width * .8,
                      child: TextField(
                        onChanged: (value) {},
                        style: TextStyle(fontSize: height / 40),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height / 60),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                            hintText: Strings.homePageHintText,
                            hintStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 45,
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
                        size: width * .09,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 20,
              ),
              Container(

                width: double.infinity,
                height: height / 4.5,

                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      width: 400,
                      height: 200,
                      child: Image.asset('assets/images/home_page/banner1.png',fit: BoxFit.cover,),
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      width: 400,
                      height: 200,
                      child: Image.asset('assets/images/home_page/banner1.png',fit: BoxFit.cover,),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: height / 40,
              ),
              ListTile(
                title: Text(
                  Strings.category,
                  style: TextStyle(
                      fontSize: height * .03, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              FutureBuilder<List<CategoryModel>>(
                future: viewCatalogPage.lists,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                        'error while fetching category\n error: ${snapshot.error}');
                  } else {
                    final List<CategoryModel> categoryList = snapshot.data!;
                    if (categoryList.isEmpty) {
                      return Text('There is no data inside category');
                    }
                    return SizedBox(
                      height: height * .2,
                      child: ListView.builder(
                          itemCount: categoryList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final itemList = categoryList[index];
                            return Container(
                              width: width * .3,
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * .001),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * .2,
                                    height: width * .18,
                                    clipBehavior: Clip.antiAlias,

                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.network(
                                      itemList.image ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: height * .014),
                                  Text(
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.fade,
                                    itemList.nameUz,
                                    style: TextStyle(
                                        color: black, fontSize: height / 55,fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            );
                          }),
                    );
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .04),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Рекоммендуемое',
                    style: TextStyle(
                        fontSize: height * .03, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              FutureBuilder<List<Product>>(
                  future: view.product,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('error${snapshot.error}'),
                      );
                    } else {
                      final products = snapshot.data;
                      if (products!.isEmpty) {
                        return const Text('no recipes found');
                      }
                      return GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .7,
                          crossAxisSpacing: width * .02,
                          // mainAxisSpacing: width*.02,
                        ),
                        itemBuilder: (context, index) {
                          final item = products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BasketPage(product: item)));
                            },
                            child:Container(
                              margin: EdgeInsets.only(right: width / 40,left: width / 40
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(item.mainImage,height: height / 7,),
                                    SizedBox(height: height / 40,),
                                    Text(item.nameUz,maxLines:2,style: TextStyle(fontSize: height / 50,
                                      overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w700
                                    ),),
                                    SizedBox(height: height / 100,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                           Row(
                                             children: [
                                               Icon(Icons.star,color: Colors.yellow,size: height / 40,),
                                               SizedBox(width: width / 40,),
                                               Text(item.rating.toString(),style: TextStyle(fontSize: height / 50,color: Colors.grey),),
                                             ],
                                           ),
                                            Container(
                                              height: height / 20,
                                              width: width / 2.8,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.yellow
                                              ),
                                              child: Center(
                                                child: Text('${item.price} сум/мес',style: TextStyle(fontSize: height / 52,fontWeight: FontWeight.w600),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
              SizedBox(height: height / 20,),
            ],
          );
        },
      ),
    ));
  }

}