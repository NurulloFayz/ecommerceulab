import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';



class InternetStateProvider with ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;


  InternetStateProvider() {
    initConnectivity();
  }

  Future<void> initConnectivity() async {
    List<ConnectivityResult> results = await Connectivity().checkConnectivity();
    _connectivityResult = results.isNotEmpty?results.first:ConnectivityResult.none;
    notifyListeners();


  }
  @override
  void dispose(){
    Connectivity().onConnectivityChanged.listen((result) {}).cancel();
    super.dispose();


  }
  ConnectivityResult get connectivity =>_connectivityResult;
}
