import 'package:ecommerce_ulab/model/product_model.dart';
import 'package:ecommerce_ulab/pages/order_product_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/strings.dart';

class BuyProductPage extends StatefulWidget {
  BuyProductPage({super.key});

  Product product = Product(
    id: '1',
    nameUz: 'Iphone 13',
    nameRu: '',
    descriptionUz: 'The best telephone ever',
    descriptionRu: '',
    price: 14000000,
    quantity: 2,
    categoryId: '1',
    brandId: '2',
    mainImage:
        'https://img.freepik.com/free-photo/creative-reels-composition_23-2149711507.jpg?t=st=1712941570~exp=1712945170~hmac=4ea323f8f396b9b632f244be9aafc08f53d7d44f98b7c0a328125e446db2de4e&w=996',
    rating: 3,
    imageFiles: [],
    videoFiles: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  State<BuyProductPage> createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage> {
  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
    'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
    'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
    'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
    'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
    'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  ];
  Color color = Color(0xFF223263);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            centerTitle: true,
            title:  Text('Корзинка',style: TextStyle(fontSize: screenHeight / 35,fontWeight: FontWeight.w800),), // Centered text
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child:  Text('Выбрать',style: TextStyle(fontSize: screenHeight / 50,fontWeight: FontWeight.w500,
                  color: Colors.blue
                  ),)
                ),
              ),
            ],
          ),
          body:SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          )
      ),
    );
  }
}
