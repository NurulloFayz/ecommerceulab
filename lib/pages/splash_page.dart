/*
import 'dart:async';

import 'package:ecommerce_ulab/pages/onBoarding_page.dart';
import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isEmailExists;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getValidationData().whenComplete(() {
      Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                finalEmail == null ?  OnBoardingPage() : MyPages(),
          ),
        ),
      );
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedEmail = preferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Splash'),
          ],
        ),
      ),
    );
  }
}
*/
