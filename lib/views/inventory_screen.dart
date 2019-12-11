import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon2019/views/inventoryItemTemplate.dart';

import 'create_product.dart';
import 'drawer.dart';

class InventoryMainScreen extends StatefulWidget {
  @override
  _InventoryMainScreenState createState() => _InventoryMainScreenState();
}

class _InventoryMainScreenState extends State<InventoryMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Inventory'),
        ),
        body: Container(
          child: new StreamBuilder(
            stream: Firestore.instance.collection("inventory").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return new ListView(
                  children: snapshot.data.documents.map((document) {
                    return InventoryItem(
                        document['barcode'],
                        document['brand'],
                        document['productName'],
                        document['date'],
                        document['calories'],
                        document['fat'],
                        document['alcohol'],
                        document['size']);
                  }).toList(),
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                );
              }
            },
          ),
        ),
        floatingActionButton: AddItemButton());
  }
}
