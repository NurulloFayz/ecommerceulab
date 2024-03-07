import 'package:ecommerce_ulab/pages/home_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/strings.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late PageController controller;
  var selected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: blue,
        currentIndex: selected,
        selectedLabelStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/50),
        unselectedLabelStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/50),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selected = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/images/u_home_icon/U.png'),
              icon:Image.asset('assets/images/u_home_icon/U_unactive.png',height: MediaQuery.of(context).size.height/30,),label: Strings.bottomText1 ),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: Strings.bottomText2),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: Strings.bottomText3),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: Strings.bottomText4),
              //BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
        ],
      ),
      // bottomNavigationBar:CupertinoTabBar(
      //   height: MediaQuery.of(context).size.height/10,
      //   backgroundColor: Colors.white,
      //   items: [
      //     BottomNavigationBarItem(icon:Image.asset('assets/images/u_home_icon/U.png',height: MediaQuery.of(context).size.height/30,),label: Strings.bottomText1 ),
      //     BottomNavigationBarItem(icon: Icon(Icons.search),label: Strings.bottomText2),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: Strings.bottomText3),
      //     BottomNavigationBarItem(icon: Icon(Icons.person),label: Strings.bottomText4),
      //     //BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
      //   ],
      // )
    );
  }
}
