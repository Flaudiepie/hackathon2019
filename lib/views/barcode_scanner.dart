import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:../hackathon2019/model/barcodeInfo.dart';

//import 'package:barcode_scan/barcode_scan.dart';

class ScanCodeButton extends StatefulWidget {
  @override
  _ScanCodeButtonState createState() => _ScanCodeButtonState();
}

class _ScanCodeButtonState extends State<ScanCodeButton> {
  String barcode = "";

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
              try{
               //WIP
              } on PlatformException catch(e){ }
            },
            ),
    );
  }
}