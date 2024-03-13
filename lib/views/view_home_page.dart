


import 'dart:async';


import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ViewHomePage extends ChangeNotifier {
  void navigateToFavouritePage(BuildContext context) {
    Navigator.pushNamed(context, FavouritePage.id);
    notifyListeners();
  }
  // late StreamSubscription stream;
  // var connected = false;
  // bool alertSet = false;
  // checkInternet() {
  //   stream = Connectivity().onConnectivityChanged.listen((
  //       ConnectivityResult result
  //       )  async{
  //     connected = await InternetConnectionChecker().hasConnection;
  //     if(!connected && alertSet == false){
  //       Center(
  //         child: IconButton(
  //           onPressed: ()async {
  //             alertSet = false;
  //             connected = await InternetConnectionChecker().hasConnection;
  //           },
  //             icon: Icon(Icons.wifi_off,color: blue,)),);
  //       alertSet = true;
  //       notifyListeners();
  //     }
  //   });
  // }
}