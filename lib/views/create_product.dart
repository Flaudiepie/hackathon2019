import 'package:datakick_sdk/datakick_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:../hackathon2019/model/barcodeInfo.dart';
import 'package:barcode_scan/barcode_scan.dart';

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
          Navigator.of(context)
             .pushNamed('/add');
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
      return !loaded ? Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
      ) 
      :
      Container(
      child: Center(child: Text("loaded")),
    );
    }
  }

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  Product product;

  @override
  void initState() {
    super.initState();
    waitForData();
  }

  waitForData() async {
    var temp = await getData().then((data) => {
      setState(() {
        product = data;
      })
    });
  }

  Future<Product> getData() async {
    return await getInfo(barcode);
  }

  @override
  Widget build(BuildContext context) {
    var barcodeFieldController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: product != null ?
      Container(
      child: Column(
        children: <Widget>[
          Center(
              child: Container(
            margin: EdgeInsets.all(15.0),
            child: TextField(
              controller: barcodeFieldController,
              decoration: InputDecoration(
                  hintText: 'Barcode',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    tooltip: 'Scan another barcode',
                    onPressed: () async {
                      var barcode = await BarcodeScanner.scan();
                      Navigator.of(context).pushReplacementNamed('/add',
                          arguments: {'barcode': barcode});
                    },
                  )),
            ),
          ))
        ],
      ),
    )
    :
    Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
      ) 
    );
  }
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
