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
            backgroundColor: greyShade3,
            title: Text(
              Strings.cartPageAppBarText,
              style: TextStyle(
                  fontSize: screenHeight / 35,
                  color: black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * .04, vertical: screenHeight * .01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Image.asset('assets/images/buy_products_page/korzinka.png',height: screenHeight / 5,),
                Text(Strings.cartPageEmptyText4,style: TextStyle(fontSize: screenHeight / 30,color: color,fontWeight: FontWeight.w700,),),
                SizedBox(height: screenHeight / 50,),
                Text(Strings.cartPageEmptyText2,style: TextStyle(fontSize: screenHeight / 40,color: Colors.grey),),
                Text(Strings.cartPageEmptyText3,style: TextStyle(fontSize: screenHeight / 40,color: Colors.grey),),
                SizedBox(height: screenHeight / 20,),
                GestureDetector(
                  child: Container(
                    height: screenHeight / 12,
                    width: screenWidth / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: blue
                      // color: view.typedText.isEmpty
                      //     ? Colors.grey.withOpacity(0.4)
                      //     : buttonColor,
                    ),
                    child: Center(
                      child: Text(
                        Strings.cartPageButtonText2,
                        style: TextStyle(
                            fontSize: screenHeight / 40,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),*/
                  SizedBox(height: screenHeight * .05),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: screenWidth * .2,
                                height: screenWidth * .2,
                                child: Image.network(widget.product.mainImage),
                              ),
                              SizedBox(
                                width: screenWidth * .05,
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenWidth * .33,
                                    child: Text(
                                      widget.product.nameUz,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: screenHeight * .02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * .01),
                                  SizedBox(
                                    width: screenWidth * .67,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${widget.product.price + 300000} сум ',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenHeight * .015,
                                              ),
                                            ),
                                            Text(
                                              '${widget.product.price} сум ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenHeight * .02,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.1,
                                        ),
                                        Container(
                                          width: screenWidth * .2,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * .001,
                                              vertical: screenHeight * .013),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                screenHeight * .01),
                                            border:
                                                Border.all(color: greyShade3),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.remove),
                                              Text('1'),
                                              Icon(Icons.add),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: greyShade1,
                            height: screenHeight * .01,
                            thickness: screenHeight * .005,
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: screenHeight * .1,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * .03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenHeight * .1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                            blurStyle: BlurStyle.normal),
                      ],
                    ),
                    width: screenWidth * .8,
                    height: screenHeight * .33,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Ваш заказ: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * .02,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2 товарa: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * .017,
                              ),
                            ),
                            Text(
                              '899 000 сум ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * .017,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * .01,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * .03,
                              vertical: screenWidth * .03),
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * .03,
                              vertical: screenWidth * .03),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: greyShade1,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Ближайшая доставка:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * .017,
                                  color: grey,
                                ),
                              ),
                              Text(
                                'Завтра,понедельник ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * .017,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Итого:* ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * .017,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '899 000 сум ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * .017,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * .1),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      minimumSize: Size(screenWidth * .8, screenHeight * .1),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderProductPage()));
                    },
                    child: Text(
                      'К оформлению',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * .03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          /*SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FanCarouselImageSlider(
                sliderWidth: 400,
                sliderHeight: 300,
                imagesLink: sampleImages,
                isAssets: false,
                autoPlay: true,
                imageFitMode: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Divider(
                color: greyShade1,
                height: height * .01,
                thickness: height * .010,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      "SmartPhone Techno Pop 5 LTE'' HD+, 2/32 GB",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height * .022,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: greyShade3)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('5.0'),
                                  Icon(CupertinoIcons.star_fill,
                                      color: Colors.yellow),
                                  Icon(CupertinoIcons.star_fill,
                                      color: Colors.yellow),
                                  Icon(CupertinoIcons.star_fill,
                                      color: Colors.yellow),
                                  Icon(CupertinoIcons.star_fill,
                                      color: Colors.yellow),
                                  Icon(CupertinoIcons.star_fill,
                                      color: Colors.yellow),
                                ],
                              ),
                              Text(
                                '80 отзывов',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: greyShade3)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '+1000',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Заказов',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: greyShade1,
                height: height * .01,
                thickness: height * .010,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'assets/images/home_page/recommend.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'assets/images/home_page/recommend.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(color: blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'assets/images/home_page/recommend.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Text('Цвет: Черный,Синий,Коричневый'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: greyShade1,
                height: height * .01,
                thickness: height * .010,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '899 000 sum',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '1 400 000 sum',
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: red,
                          ),
                          child: Text(
                            '-45%',
                            style: TextStyle(color: white),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.watch_later_outlined,
                          color: red,
                        ),

                        Text(
                          '37:50:00',
                          style: TextStyle(color: red),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: red,
                          ),
                          child: Text(
                            'Временная скидка',
                            style: TextStyle(color: white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.yellow,
                      ),
                      child: Text(
                        '109 378 сум/мес',
                        style: TextStyle(color: black),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow,
                            ),
                            child: Text(
                              'От 16 378 сум/мес',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text('в рассрочку'),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right,
                              size: 20,
                              color: blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Icon(Icons.done),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'В наличии 93 шт',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange,
                          ),
                          child: Icon(Icons.shopping_bag_outlined),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '48 человек купили на этой неделе',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: greyShade1,
                height: height * .01,
                thickness: height * .010,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Характеристики',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Краткое описание не заполнено',
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      width: width,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade1,
                      ),
                      child: Text(
                        'Полное описание ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Material(
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      top: BorderSide(
                        color: blue,
                        width: 2
                      ),
                    ),
                  ),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1 400 000 сум',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: grey),
                          ),
                          Text(
                            '899 000 сум',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: blue),
                        onPressed: () {},
                        child: Text(
                          'В корзинку',
                          style: TextStyle(color: white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),*/
          ),
    );
  }
}
