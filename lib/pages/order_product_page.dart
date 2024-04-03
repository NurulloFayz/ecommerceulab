import 'package:ecommerce_ulab/model/product_model.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

import '../utils/strings.dart';

class OrderProduct extends StatefulWidget {
  const OrderProduct({super.key, required Product product});

  @override
  State<OrderProduct> createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,

          appBar: AppBar(
            backgroundColor: white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                size: 35,
                color: blue,
              ),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 35,
                      color: blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      size: 35,
                      color: blue,
                    ),
                  ),
                ],
              ),
            ],
            centerTitle: true,
          ),
          body:
        SingleChildScrollView(
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
        ),
      ),
    );
  }
}
