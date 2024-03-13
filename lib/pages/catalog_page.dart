import 'package:ecommerce_ulab/views/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../utils/color.dart';
import '../utils/strings.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.left_chevron,
                      color: grey,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: width * .82,
                    child: TextField(
                      style: TextStyle(fontSize: height / 40),
                      controller: searchController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height / 60),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          hintText: Strings.homePageHintText,

                          hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
                              color: Colors.grey.withOpacity(0.8)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ],
              ),
              Divider(
                color: grey,
                height: height*.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
