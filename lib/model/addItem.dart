import 'package:datakick_sdk/datakick_sdk.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon2019/model/item.dart';

final databaseReference = Firestore.instance;

void addItem(Item product){
  //Database connection here! WIP
}

void getData() {
    databaseReference
        .collection("inventory")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }