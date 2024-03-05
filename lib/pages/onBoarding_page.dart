import 'package:ecommerce_ulab/pages/auth_screen.dart';
import 'package:ecommerce_ulab/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> getPages() {
      return [
        PageViewModel(
          decoration: const PageDecoration(
              imageAlignment: Alignment.center, imageFlex: 4),
          image: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            child: Image.asset(
              'assets/images/intro_page/intro1.png',
              fit: BoxFit.fill,
            ),
          ),
          bodyWidget: Container(),
          titleWidget: Container(),
          footer: Center(
            child: Text(
              textAlign: TextAlign.center,
              Strings.intro1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageAlignment: Alignment.center, imageFlex: 4),
          image: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            child: Image.asset(
              'assets/images/intro_page/intro2.png',
              fit: BoxFit.fill,
            ),
          ),
          bodyWidget: Container(),
          titleWidget: Container(),
          footer: Center(
            child: Text(
              textAlign: TextAlign.center,
              Strings.intro2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageAlignment: Alignment.center, imageFlex: 4),
          image: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            child: Image.asset(
              'assets/images/intro_page/intro3.png',
              fit: BoxFit.fill,
            ),
          ),
          titleWidget: Container(),
          footer: Center(
            child: Text(
              textAlign: TextAlign.center,
              Strings.intro3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
          ),
          bodyWidget: Container(),
        ),
      ];
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IntroductionScreen(
            showBackButton: false,
            showNextButton: false,
            done: Text(Strings.buttonText),
            onDone: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthPage(),
                ),
              );
            },
            pages: getPages(),
          ),
        ),
      ),
    );
  }
}
