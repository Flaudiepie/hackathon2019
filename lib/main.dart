import 'package:flutter/material.dart';
import 'package:hackathon2019/barcode_scanner.dart';
import 'package:hackathon2019/drawer.dart';
import 'package:hackathon2019/inventory_screen.dart';


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

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(
          child: Text('Homepage'),
        ),
        floatingActionButton: ScanCodeButton(),
      );
  }
}