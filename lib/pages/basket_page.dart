import 'package:ecommerce_ulab/controller/service/post_product.dart';
import 'package:ecommerce_ulab/model/product_model.dart';
import 'package:ecommerce_ulab/pages/buy_product_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../injector_container.dart';
import '../repository/repository.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key, required this.product,});

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

  var isLoading = false;

  void setLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void dismissLoading() {
    setState(() {
      isLoading = false;
    });
  }


  Future<void> postProduct() async {
    setLoading();
    final result = await sl<ApiRepository>().addProductToBasket(productId: widget.product.id,quantity: 1);
    result.fold(
          (left) {

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ${left.message}')));
      },
          (right) {
        dismissLoading();
        print('successs');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Yangi mahsulot qo'shildi")));
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.navigate_before,color: blue,),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.favorite_border,color: blue,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight / 4,
              width: screenWidth,
              child: Center(
                child: Image.network(widget.product.mainImage,height: screenHeight / 3,),
              ),
            ),
            Divider(
              thickness: 10,
              color: Colors.grey.withOpacity(0.2),
            ),
            ListTile(
              title: Text(widget.product.nameUz,style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w600),),
            ),
            Row(
              children: [
                SizedBox(width: screenWidth / 40,),
                Container(
                  height: screenHeight / 20,
                  width: screenWidth / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(widget.product.rating.toString(),style: TextStyle(fontSize: screenHeight / 48,
                          // fontWeight: FontWeight.w700
                          // ),),
                          SizedBox(width: screenWidth / 70,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(widget.product.price.toString() + ' сум ',style: TextStyle(fontSize: screenHeight / 40,fontWeight: FontWeight.w500),),
            ),
            ListTile(
              title: Text('описание',style: TextStyle(fontSize: screenHeight / 35,fontWeight: FontWeight.w500),),
            ),
            Container(
              margin: EdgeInsets.only(right: screenWidth / 40,left: screenWidth / 40),
              child: Text(widget.product.descriptionUz,style: TextStyle(fontSize: screenHeight / 45,fontWeight: FontWeight.w500,
              color: Colors.grey
              ),),
            ),
            SizedBox(height: screenHeight / 20,),
            GestureDetector(
              onTap: () {
                postProduct();
              },
              child: Container(
                height: screenHeight / 15,
                width: screenWidth / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: blue
                ),
                child: Center(
                  child: Text('В корзинку',style: TextStyle(fontSize: screenHeight / 40,color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: screenHeight / 20,),
          ],
        ),
      ),
    );
  }
}
