import 'package:flutter/material.dart';
import 'package:hackathon2019/drawer.dart';

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
      home: WelcomeScreen()
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(),
        body: Center(
          child: Text('Homepage'),
        ),
      );
  }
}