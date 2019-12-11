import 'package:cloud_firestore/cloud_firestore.dart';
import 'item.dart';

final databaseReference = Firestore.instance;

Future<List<dynamic>> getElements() async{
  List<dynamic> test;
 await databaseReference
      .collection("inventory")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    test = snapshot.documents.toList();
  });
  return test;
} 

void addElement(Item itemToAdd) async{
  await databaseReference
  .collection("inventory")
  .add({
      'barcode': itemToAdd.barcode,
      'brand': itemToAdd.brand,
      'productName': itemToAdd.productName,
      'alcohol': itemToAdd.alcohol,
      'calories': itemToAdd.calories,
      'date': itemToAdd.date,
      'fat': itemToAdd.fat,
      'size': itemToAdd.size,
  });
}