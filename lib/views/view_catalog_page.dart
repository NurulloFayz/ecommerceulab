

import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:flutter/material.dart';

class ViewCatalogPage {

  TextEditingController searchController = TextEditingController();

  void navigateToMyPages(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyPages()));
  }
  Color color = const Color(0xFFF5F6F8);
}