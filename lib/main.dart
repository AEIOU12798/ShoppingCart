import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/cartpage1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cartpage1(),
    );
  }
}
