import 'package:flutter/material.dart';

import 'views/inventory_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[500],
        accentColor: Colors.white
      ),
      title: 'Hackathon 2019',
      home: InventoryMainScreen(),
      routes: {
        '/inventory': (ctx) => InventoryMainScreen(),
      },
    );
  }
}