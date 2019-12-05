import 'package:flutter/material.dart';

class InventoryItem extends StatelessWidget {

  final String title;

  InventoryItem(
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child:
          Text(title, style: TextStyle(
          color: Colors.black,
          fontSize: 18 )
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}