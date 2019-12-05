import 'package:flutter/material.dart';

class InventoryProduct{
  final int id;
  final String name;

  const InventoryProduct({
     @required this.id, 
      this.name
    }
   );
}