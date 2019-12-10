import 'package:flutter/material.dart';
import 'package:hackathon2019/views/create_product.dart';

import 'views/inventory_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.white
      ),
      title: 'Hackathon 2019',
      home: InventoryMainScreen(),
      routes: {
        '/add': (ctx) => ProductDetails(),
      },
    );
  }
}