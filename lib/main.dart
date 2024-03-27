import 'package:ecommerce_ulab/controller/provider/product_provider.dart';
import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/pages/auth_pages/enter_email_code_page.dart';
import 'package:ecommerce_ulab/pages/catalog_page.dart';
import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:ecommerce_ulab/pages/home_page.dart';
import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:ecommerce_ulab/pages/profile_page.dart';
import 'package:ecommerce_ulab/pages/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
          ChangeNotifierProvider<ProductProvider>(create: (context)=>ProductProvider()),
       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const EmailPage(),
        routes: {
          EmailPage.id:(context) => const EmailPage(),
          EnterEmailCodePage.id:(context) => const EnterEmailCodePage(''),
          HomePage.id:(context) => const HomePage(),
          FavouritePage.id:(context) => const FavouritePage(),
        },
      ),
    );
  }
}