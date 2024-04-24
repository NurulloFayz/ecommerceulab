import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class BuyProductPage extends StatefulWidget {
  BuyProductPage({super.key});


  @override
  State<BuyProductPage> createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage> {
  Color color = Color(0xFF223263);
  int quantity = 0;
  int quantity1 = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Корзинка',
            style: TextStyle(
                fontSize: screenHeight / 35, fontWeight: FontWeight.w800),
          ),
          // Centered text
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                  child: Text(
                'Выбрать',
                style: TextStyle(
                    fontSize: screenHeight / 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              )),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.remove_shopping_cart,color: Colors.blue,size: screenHeight / 10,),
              Text('Empty',style: TextStyle(fontSize: screenHeight / 35,fontWeight: FontWeight.w400),),
            ],
          )
        )
      ),
    );
  }
}
