import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/service/basket_api.dart';
import '../model/basket_model.dart';

class BuyProductPage extends StatefulWidget {
  @override
  _BuyProductPageState createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage> {
  late Future<ProductList> productListFuture;
  late String? token;

  @override
  void initState() {
    super.initState();
    // Retrieve token from SharedPreferences
    getTokenFromSharedPreferences().then((value) {
      setState(() {
        token = value;
        productListFuture = BasketApi.fetchBusket(token!);
      });
    });
  }

  Future<String?> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Корзина',style: TextStyle(fontSize: screenHeight / 35),),
      ),
      body: FutureBuilder<ProductList>(
        future: productListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // If the data is successfully fetched, display the product list
            return ListView.builder(
              itemCount: snapshot.data!.products.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Image.network(snapshot.data!.products[index].mainImage),
                      title: Text('${snapshot.data!.products[index].price.toString()} сум',style: TextStyle(
                        fontSize: screenHeight / 40,fontWeight: FontWeight.w500
                      ),),
                      subtitle:  Text(snapshot.data!.products[index].nameRu,style: TextStyle(
                        fontSize: screenHeight / 45,fontWeight: FontWeight.w400
                      ),),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.3),indent: screenWidth / 20,endIndent: screenWidth / 20,)
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
