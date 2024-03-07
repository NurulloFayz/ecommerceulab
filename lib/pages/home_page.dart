import 'package:flutter/material.dart';

import '../utils/strings.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/40,left:MediaQuery.of(context).size.width/40 ),
              child: TextField(
                style: TextStyle(fontSize: MediaQuery.of(context).size.height/40),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height/60),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: Strings.homePageHintText,
                  hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.height/45,color: Colors.grey.withOpacity(0.8)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
