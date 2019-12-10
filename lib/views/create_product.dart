import 'package:datakick_sdk/datakick_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:../hackathon2019/model/barcodeInfo.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:hackathon2019/model/addItem.dart';
import 'package:hackathon2019/model/item.dart';
import 'package:intl/intl.dart';

String barcode = "";

class AddItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        fillColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        child: new Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
          size: 30,
        ),
        onPressed: () async {
          //  var barcode = await BarcodeScanner.scan();
          barcode = '3057640376498';
          Navigator.of(context).pushNamed('/add');
        },
      ),
    );
  }
}

class ProductDetails2 extends StatefulWidget {
  @override
  _ProductDetails2State createState() => _ProductDetails2State();
}

class _ProductDetails2State extends State<ProductDetails2> {
  String test;

  loadData() async {
    print("Loading");

    Timer(Duration(seconds: 3), () {
      print("Timer vorbei");
      setState(() {
        test = "Hallo";
        loaded = true;
      });
    });
  }

  initFunction() async {
    await loadData();
  }

  @override
  void initState() {
    super.initState();
    initFunction();
  }

  bool loaded = false;
  @override
  Widget build(BuildContext context) {
    return !loaded
        ? Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            ),
          )
        : Container(
            child: Center(child: Text("loaded")),
          );
  }
}

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productNameFocus = new FocusNode();
  final caloriesFocus = new FocusNode();
  final fatFocus = new FocusNode();
  final alcoholFocus = new FocusNode();
  final sizeFocus = new FocusNode();
  var dateController = new TextEditingController();
  DateTime chosenDate;
  final form = GlobalKey<FormState>();
  var item = Item(
      barcode: barcode,
      brand: '',
      productName: '',
      alcohol: 0,
      calories: 0,
      date: DateTime.now(),
      fat: 0,
      size: 0);

  Product product;
  dynamic initValues;

  @override
  void initState() {
    super.initState();
    waitForData();
  }

  waitForData() async {
    var temp = await getData().then((data) => {
          setState(() {
            product = data;
            initValues = {
              'barcode': barcode,
              'brand': product.brand_name,
              'productName': product.name,
              'alcohol':  checkForNull(product.alcohol_by_volume),
              'calories': checkForNull(product.calories),
              'date': new DateFormat.yMMMd().format(DateTime.now()),
              'fat': checkForNull(product.fat),
              'size': removeUnit(product.size)
            };
          })
        });
  }

  Future<Product> getData() async {
    return await getInfo(barcode);
  }

  @override
  void dispose() {
    productNameFocus.dispose();
    caloriesFocus.dispose();
    fatFocus.dispose();
    alcoholFocus.dispose();
    sizeFocus.dispose();
    super.dispose();
  }

  void saveData() {
    form.currentState.save();
    addItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: product != null
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: initValues['barcode'],
                      readOnly: true,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Theme.of(context).primaryColor)),
                        hintText: 'Insert barcode here',
                        labelText: 'Barcode',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.camera_alt),
                          tooltip: 'Scan another barcode',
                          onPressed: () async {
                            barcode = await BarcodeScanner.scan();
                            Navigator.of(context).pushReplacementNamed('/add');
                          },
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: initValues['brand'],
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(productNameFocus);
                      },
                      decoration: InputDecoration(
                        labelText: 'Brand name',
                        icon: Icon(Icons.business_center),
                      ),
                      onSaved: (value) {
                        item = Item(
                            barcode: item.barcode,
                            brand: value,
                            productName: item.productName,
                            alcohol: item.alcohol,
                            calories: item.calories,
                            date: item.date,
                            fat: item.fat,
                            size: item.size);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['productName'],
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(caloriesFocus);
                      },
                      focusNode: productNameFocus,
                      decoration: InputDecoration(
                        labelText: 'Product name',
                        icon: Icon(Icons.bookmark),
                      ),
                      onSaved: (value) {
                        item = Item(
                            barcode: item.barcode,
                            brand: item.brand,
                            productName: value,
                            alcohol: item.alcohol,
                            calories: item.calories,
                            date: item.date,
                            fat: item.fat,
                            size: item.size);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['date'],
                      readOnly: true,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2999),
                          builder: (BuildContext context, Widget child) {
                            return Theme(
                              data: ThemeData.dark(),
                              child: child,
                            );
                          },
                        ).then((data) => {
                              dateController.text =
                                  new DateFormat.yMMMd().format(data),
                              chosenDate = data,
                            });
                      },
                      decoration: InputDecoration(
                        labelText: 'Expiring date (not required)',
                        icon: Icon(Icons.calendar_today),
                      ),
                      onSaved: (value) {
                        item = Item(
                            barcode: item.barcode,
                            brand: item.brand,
                            productName: item.productName,
                            alcohol: item.alcohol,
                            calories: item.calories,
                            date: chosenDate,
                            fat: item.fat,
                            size: item.size);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['calories'],
                      focusNode: caloriesFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(fatFocus);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Calories (not required)',
                        icon: Icon(Icons.cake),
                      ),
                      maxLength: 10,
                      onSaved: (value) {
                        item = Item(
                            barcode: item.barcode,
                            brand: item.brand,
                            productName: item.productName,
                            alcohol: item.alcohol,
                            calories: parseToDouble(value),
                            date: item.date,
                            fat: item.fat,
                            size: item.size);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['fat'],
                      focusNode: fatFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(alcoholFocus);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Fat (not required)',
                        icon: Icon(Icons.fastfood),
                      ),
                      maxLength: 10,
                      onSaved: (value) {
                        item = Item(
                            barcode: item.barcode,
                            brand: item.brand,
                            productName: item.productName,
                            alcohol: item.alcohol,
                            calories: item.calories,
                            date: item.date,
                            fat: parseToDouble(value),
                            size: item.size);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['alcohol'],
                      focusNode: alcoholFocus,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(sizeFocus);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Value from 0 to 100',
                        labelText: 'Alcohol (not required)',
                        icon: Icon(Icons.local_drink),
                      ),
                      onSaved: (value) {
                        item = Item(
                            barcode: item.barcode,
                            brand: item.brand,
                            productName: item.productName,
                            alcohol: parseToDouble(value),
                            calories: item.calories,
                            date: item.date,
                            fat: item.fat,
                            size: item.size);
                      },
                    ),
                    TextFormField(
                      initialValue: initValues['size'],
                      focusNode: sizeFocus,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Size in litre/gram',
                        labelText: 'Set size (not required)',
                        icon: Icon(Icons.arrow_upward),
                      ),
                      maxLength: 10,
                      onSaved: (value) {
                        item = Item(
                            barcode: item.barcode,
                            brand: item.brand,
                            productName: item.productName,
                            alcohol: item.alcohol,
                            calories: item.calories,
                            date: item.date,
                            fat: item.fat,
                            size: parseToDouble(value));
                      },
                      onFieldSubmitted: (_) {
                        saveData();
                      },
                    ),
                  ],
                ),
              ),
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
    );
  }

  double parseToDouble(String input){
    return double.tryParse(input);
  }

  String checkForNull(double input){
    if(input != null){
      return input.toString();
    }
    return '';
  }

  String removeUnit(String input){
    if(input.isNotEmpty){
    try
    {
      int.parse(input[input.length - 1]);
      return input;
    }
    catch(e)
    {
      return input.substring(0, input.length - 1);
    }
    }
    return input;
  }

  // void submitData() {}

  // void checkPercentageInput(String input) {
  //   try {
  //     var toCheck = double.parse(input);
  //     if (toCheck > 100.99) {
  //       alcoholController.text = "";
  //     }
  //   } catch (e) {
  //     alcoholController.text = "";
  //   }
  // }
}

Widget submitButton(BuildContext context, Function function) {
  return Container(
    height: 70.0,
    width: 70.0,
    child: new RawMaterialButton(
      shape: new CircleBorder(),
      fillColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      child: new Icon(
        Icons.check,
        color: Theme.of(context).accentColor,
        size: 30,
      ),
      onPressed: function,
    ),
  );
}
// return Scaffold(
//   appBar: AppBar(
//     title: Text('Add Item'),
//     ),
//   body:
//   Center(
//     child: ListView(
//       children: <Widget> [
//         Padding(
//           padding: const EdgeInsets.all(50.0),
//           child: TextFormField(
//             onEditingComplete: getProduct,
//             controller: controller,
//             decoration: InputDecoration(
//               labelText: 'Barcode',
//               border: OutlineInputBorder(),
//               suffix: IconButton(
//                icon: Icon(Icons.search),
//                onPressed: getProduct,
//               )),
//              inputFormatters: [new LengthLimitingTextInputFormatter(128), WhitelistingTextInputFormatter.digitsOnly], keyboardType: TextInputType.number,
//            )
//     ),
//     Center(
//       child: Text(
//       'or',
//       style: TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.bold
//       ),
//     ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(40.0),
//       child:
//        RaisedButton(
//         padding: const EdgeInsets.all(20.0),
//         color: Colors.white70,
//         textColor: Colors.black,
//         child: Text('Scan Barcode', style: TextStyle(fontSize: 20),),
//         onPressed: () {}
//         ,)
//       ,)
//     ]
//   ),
//   ),
// );
