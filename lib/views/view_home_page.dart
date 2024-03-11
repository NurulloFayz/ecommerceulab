

import 'package:ecommerce_ulab/pages/favourite_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ViewHomePage extends ChangeNotifier {
  void navigateToFavouritePage(BuildContext context) {
    Navigator.pushNamed(context, FavouritePage.id);
    notifyListeners();
  }
}