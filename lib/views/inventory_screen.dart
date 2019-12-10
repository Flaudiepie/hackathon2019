import 'package:flutter/material.dart';
import 'package:hackathon2019/model/dummy_data.dart';

import 'create_product.dart';
import 'drawer.dart';
import 'inventoryItemTemplate.dart';

class InventoryMainScreen extends StatefulWidget {
  @override
  _InventoryMainScreenState createState() => _InventoryMainScreenState();
}

class _InventoryMainScreenState extends State<InventoryMainScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
        appBar: AppBar(title: Text('Inventory'),),
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
      floatingActionButton: AddItemButton()
    );
  }
}