import 'package:flutter/material.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [

        ],
      ),
    );
  }
}
