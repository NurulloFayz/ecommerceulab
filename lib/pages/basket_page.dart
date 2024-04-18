import 'package:ecommerce_ulab/controller/service/post_product.dart';
import 'package:ecommerce_ulab/model/product_model.dart';
import 'package:ecommerce_ulab/pages/buy_product_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key, required this.product});

  final Product product;

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/creative-reels-composition_23-2149711507.jpg?t=st=1712941570~exp=1712945170~hmac=4ea323f8f396b9b632f244be9aafc08f53d7d44f98b7c0a328125e446db2de4e&w=996',
    'https://img.freepik.com/free-photo/elegant-smartphone-composition_23-2149437106.jpg?t=st=1712941622~exp=1712945222~hmac=56e1a32468bbfcd9c0de78cda2a5acbf9ac5cc4005ebbb17b1ff5f6ae9366d02&w=360',
    'https://img.freepik.com/premium-photo/female-holding-smartphone-with-icons-social-media-screen-home_126277-412.jpg?w=996'
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FanCarouselImageSlider(
                sliderHeight: screenHeight * .3,
                // sliderWidth: screenHeight*.2,
                imagesLink: sampleImages,
                isAssets: false,
                autoPlay: true,
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
              Divider(
                color: greyShade3,
                height: screenHeight * .01,
                thickness: screenHeight * .01,
              ),
              Text(
                widget.product.nameUz,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .03,
                ),
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
              Divider(
                color: greyShade3,
                height: screenHeight * .01,
                thickness: screenHeight * .01,
              ),
              Text(
                'Характеристики',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .03,
                ),
              ),
              Text(
                widget.product.descriptionRu,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .02,
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Icon(Icons.done),
                  ),
                  SizedBox(width: screenWidth*.01,),
                  Text(
                    'В наличии ${widget.product.quantity} шт',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * .03,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product.price + 300000} сум ',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * .03,
                        ),
                      ),
                      Text(
                        '${widget.product.price} сум ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * .03,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: blue),
                    onPressed: () {
                      //postData();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyProductPage(/*product:widget.product*/)));
                    },
                    child: Text(
                      'В корзинку',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * .03,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
