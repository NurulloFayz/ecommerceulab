

import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:flutter/material.dart';

class ViewCatalogPage {
  void navigateToMyPages(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyPages()));
  }
}