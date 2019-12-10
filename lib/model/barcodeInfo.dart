import 'dart:convert';

import 'package:datakick_sdk/datakick_sdk.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<Product> getInfo(String barcode) async
{
    if(barcode.isNotEmpty){
      String uri = "https://www.datakick.org/api/items/" + barcode;
    final http.Response resp = await http.get(uri);
    Map productMap = json.decode(resp.body);
    return new Product.fromJson(productMap);
    }
    return null;
}