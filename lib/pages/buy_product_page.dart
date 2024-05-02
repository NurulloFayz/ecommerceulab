import 'package:flutter/material.dart';
import '../controller/service/basket_api.dart';
import '../model/basket_model.dart';


class BuyProductPage extends StatefulWidget {
  @override
  _BuyProductPageState createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage> {
  late Future<ProductList> productListFuture;

  @override
  void initState() {
    super.initState();
    productListFuture = BasketApi.fetchBusket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
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
                return ListTile(
                  leading: Image.network(snapshot.data!.products[index].mainImage),
                  title: Text(snapshot.data!.products[index].nameRu),
                  subtitle: Text('Price: \$${snapshot.data!.products[index].price.toString()}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
