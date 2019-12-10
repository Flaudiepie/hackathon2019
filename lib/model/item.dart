import 'package:flutter/material.dart';

class Item {
  @required String barcode; 
  @required String brand;
  @required String productName; 
  DateTime date;
  double calories; 
  double fat; 
  double alcohol;
  double size;

  Item({
    @required this.barcode,
    @required this.brand,
    @required this.productName,
    this.date,
    this.calories,
    this.fat,
    this.alcohol,
    this.size,
  });
}
