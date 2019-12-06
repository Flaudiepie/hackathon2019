import 'package:flutter/material.dart';

Container buildDetailScreen(String name){
  return Container(
    child: Container(
      margin: EdgeInsets.all(25),
       child: Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ), 
      ),
    );
}