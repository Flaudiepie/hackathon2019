import 'package:flutter/material.dart';
import 'package:hackathon2019/barcode_scanner.dart';
import 'package:hackathon2019/drawer.dart';
import 'package:hackathon2019/inventoryItemTemplate.dart';
import 'package:hackathon2019/model/dummy_data.dart';

class InventoryMainScreen extends StatefulWidget {
  @override
  _InventoryMainScreenState createState() => _InventoryMainScreenState();
}

class _InventoryMainScreenState extends State<InventoryMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(),
        body:
      GridView(
      children: DUMMY_DATA.map(
        (invData) => InventoryItem(invData.name)
        ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      ),
      floatingActionButton: ScanCodeButton(),
    );
  }
}