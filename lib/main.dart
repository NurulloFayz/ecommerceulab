import 'package:ecommerce_ulab/controller/provider/product_provider.dart';
import 'package:ecommerce_ulab/injector_container.dart';
import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/pages/auth_pages/enter_email_code_page.dart';
import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:ecommerce_ulab/pages/home_page.dart';
import 'package:ecommerce_ulab/pages/onBoarding_page.dart';
import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final prefs = await SharedPreferences.getInstance();
  final bool isTokenExists = prefs.containsKey('token');

  runApp(MyApp(isTokenExists: isTokenExists));
}

class MyApp extends StatefulWidget {
   const MyApp({super.key, required this.isTokenExists} );
   final bool isTokenExists;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



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
        home:EmailPage(),
        //widget.isTokenExists ? const MyPages() : const OnBoardingPage(),
      //  const MyPages(),

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