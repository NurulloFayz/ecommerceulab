import 'package:ecommerce_ulab/controller/provider/product_provider.dart';
import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/pages/auth_pages/enter_email_code_page.dart';
import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:ecommerce_ulab/pages/home_page.dart';
import 'package:ecommerce_ulab/pages/onBoarding_page.dart';
import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:ecommerce_ulab/pages/splash_page.dart';
import 'package:ecommerce_ulab/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isTokenExists = false;

  getToken()async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    isTokenExists =  preferences.getString('token') != null;
    if(preferences.getString('token') != null){
      isTokenExists = true;
    }else{
      isTokenExists = false;
    }

  }
  @override
  void initState() {
    getToken();
    super.initState();
  }

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
        home:  isTokenExists?MyPages(): OnBoardingPage(),
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