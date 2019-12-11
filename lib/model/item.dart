import 'package:flutter/material.dart';

class Item {
  @required int id;
  @required String barcode; 
  @required String brand;
  @required String productName; 
  DateTime date;
  double calories; 
  double fat; 
  double alcohol;
  String size;

  Item({
    @required this.barcode,
    @required this.brand,
    @required this.productName,
    this.id = 0,
    this.date,
    this.calories,
    this.fat,
    this.alcohol,
    this.size,
  });
}
