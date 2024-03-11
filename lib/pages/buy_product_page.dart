import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/strings.dart';

class BuyProductPage extends StatefulWidget {
  const BuyProductPage({super.key});

  @override
  State<BuyProductPage> createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            Strings.bottomText3,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: width * .7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/buy_products_page/korzinka.png'),
                Text(
                  "В вашей корзине нет товаров подберите на товары главной странице",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: grey,
                    fontSize: height * .02,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      minimumSize: Size(width*.6, height*.055),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                    ),
                    onPressed: () {},
                    child: Text(
                      Strings.cartPageButtonText2,
                      style: TextStyle(
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
