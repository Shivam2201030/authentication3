import 'package:flutter/material.dart';
import 'package:dioapi/view/view.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ProductView(),
    );
  }
}
