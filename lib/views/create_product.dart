import 'package:datakick_sdk/datakick_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:../hackathon2019/model/barcodeInfo.dart';

import 'drawer.dart';


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
            onPressed: () {
              Navigator.of(context).pushNamed('/add');
            },
            ),
    );
  }
}

class AddProductScreen extends StatefulWidget {
  @override
  AddProductScreenState createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {

  TextEditingController controller = TextEditingController();
  Product product = new Product.empty();

  Future getProduct() async {
    if(controller.text.isNotEmpty)
    {
      product = await getInfo(controller.text);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
        ),
      body: 
      Center(
        child: ListView(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextFormField(
                onEditingComplete: getProduct,
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Barcode', 
                  border: OutlineInputBorder(), 
                  suffix: IconButton(
                   icon: Icon(Icons.search),
                   onPressed: getProduct,
                  )),
                 inputFormatters: [new LengthLimitingTextInputFormatter(128), WhitelistingTextInputFormatter.digitsOnly], keyboardType: TextInputType.number,
               )
        ),
        Center(
          child: Text(
          'or',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: 
           RaisedButton(
            padding: const EdgeInsets.all(20.0),
            color: Colors.white70,
            textColor: Colors.black,
            child: Text('Scan Barcode', style: TextStyle(fontSize: 20),), 
            onPressed: () {} //implement camera scan function
            ,)
          ,)
        ]
      ),
      ),
    );
  }
}