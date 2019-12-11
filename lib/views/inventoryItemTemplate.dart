import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon2019/model/item.dart';
import 'InventoryDetailScreen.dart';

class InventoryItem extends StatelessWidget {

  final String barcode;
  final String brand;
  final String productName;
  final Timestamp date;
  final double calories;
  final double fat;
  final double alcohol;
  final String size;
  Item item;

  InventoryItem(
      this.barcode,
      this.brand,
      this.productName,
      this.date,
      this.calories,
      this.fat,
      this.alcohol,
      this.size){
        item = Item(barcode: barcode, brand: brand, productName: productName, alcohol: alcohol, calories: calories,date: date.toDate(), fat: fat, size: size);
      }

  void onItemPressed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 350,
            child: Container(
              child: buildDetailScreen(item),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40),
                  topRight: const Radius.circular(40),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: ListTile(
          onTap: () {
            onItemPressed(context);
          },
          leading: Icon(Icons.play_arrow),
          title: Text(productName),
          subtitle: Text(brand),
        ),
      ),
    );
  }
}
