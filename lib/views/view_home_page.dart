

import 'dart:math';

import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ViewHomePage extends ChangeNotifier {
  void navigateToFavouritePage(BuildContext context) {
    Navigator.pushNamed(context, FavouritePage.id);
    notifyListeners();
  }
  bool connectedInternet = false;
  void checkInternetConnection()async {
    bool result = await InternetConnectionChecker().hasConnection;
    //connectedInternet = result;
    if(connectedInternet) {
      print('you are connected');
    } else {
      print('you are offline,please connect to internet');
    }
  }
}