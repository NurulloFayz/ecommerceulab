import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/pages/auth_pages/enter_email_code_page.dart';
import 'package:ecommerce_ulab/pages/auth_pages/enter_name_bdate.dart';
import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:ecommerce_ulab/pages/onBoarding_page.dart';
import 'package:ecommerce_ulab/pages/pages.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPages(),
      routes: {
        EmailPage.id:(context) => EmailPage(),
        EnterEmailCodePage.id:(context) => EnterEmailCodePage(''),
        FavouritePage.id:(context) => FavouritePage(),
      },
    );
  }
}