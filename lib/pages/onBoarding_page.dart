
import 'package:ecommerce_ulab/pages/auth_pages/email_page.dart';
import 'package:ecommerce_ulab/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/color.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  int pageIndex = 0;
   PageController pageController = PageController();
  @override
  void initState() {
    pageController = PageController(initialPage: 0);


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Material(
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index){
          setState(() {
            pageIndex = index;
          });
        },
        children: [
          Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .1,
                ),
                Container(
                  color: white,
                  width: width,
                  height: height * .3,
                  child: Lottie.asset('assets/lottie/onboarding1.json'),
                ),
                Text(
                  textAlign: TextAlign.center,
                  Strings.intro1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                Container(
                  width: width * .2,
                  height: height * .2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex==0? blue:grey,
                        ),
                      ),
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex==0? grey:blue,
                        ),
                      ),
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  pageIndex==0? grey:blue,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width*.7, height*.07),
                    backgroundColor: blue,
                  ),
                  onPressed: () {
                    if (pageIndex == 2) {
                      // Navigate to HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EmailPage()),
                      );
                    } else {
                      // Navigate to next page
                      pageController.animateToPage(pageIndex + 1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text(Strings.buttonText,style: TextStyle(color: white,),),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .1,
                ),
                Container(
                  color: white,
                  width: width,
                  height: height * .3,
                  child: Lottie.asset('assets/lottie/onboarding2.json'),
                ),
                Text(
                  textAlign: TextAlign.center,
                  Strings.intro2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                Container(
                  width: width * .2,
                  height: height * .2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:   pageIndex==1? grey:blue,
                        ),
                      ),
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:   pageIndex==1? blue:grey
                        ),
                      ),
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  pageIndex==1? grey:blue,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width*.7, height*.07),
                    backgroundColor: blue,
                  ),
                  onPressed: () {
                    if (pageIndex == 2) {
                      // Navigate to HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EmailPage()),
                      );
                    } else {
                      // Navigate to next page
                      pageController.animateToPage(pageIndex + 1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text(Strings.buttonText,style: TextStyle(color: white,),),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .1,
                ),
                Container(
                  color: white,
                  width: width,
                  height: height * .3,
                  child: Lottie.asset('assets/lottie/onboarding3.json'),
                ),
                Text(
                  textAlign: TextAlign.center,
                  Strings.intro3,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                Container(
                  width: width * .2,
                  height: height * .2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex==2 ?grey:blue,
                        ),
                      ),
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:pageIndex==2 ?grey:blue,
                        ),
                      ),
                      Container(
                        width: height * .01,
                        height: height * 01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:pageIndex==2 ?blue:grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width*.7, height*.07),
                    backgroundColor: blue,
                  ),
                  onPressed: () {
                    if (pageIndex == 2) {
                      // Navigate to HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EmailPage()),
                      );
                    } else {
                      // Navigate to next page
                      pageController.animateToPage(pageIndex + 1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text(Strings.buttonText,style: TextStyle(color: white,),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
