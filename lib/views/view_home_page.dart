


import 'dart:async';
import 'dart:convert';


import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ViewHomePage extends ChangeNotifier {
  void navigateToFavouritePage(BuildContext context) {
    Navigator.pushNamed(context, FavouritePage.id);
    notifyListeners();
  }
}