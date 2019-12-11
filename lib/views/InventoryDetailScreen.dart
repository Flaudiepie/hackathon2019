import 'package:flutter/material.dart';
import 'package:hackathon2019/model/item.dart';
import 'package:intl/intl.dart';

Container buildDetailScreen(Item item) {
  return Container(
    child: Container(
      margin: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              item.productName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Brand: ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${item.brand}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Expiring date: ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${new DateFormat.yMMMd().format(item.date)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Calories: ',
                  style: TextStyle(fontSize: 18),
                ),
                item.calories != null
                    ? Text(
                        '${item.calories}g',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Unknown',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Fat: ',
                  style: TextStyle(fontSize: 18),
                ),
                item.fat != null
                    ? Text(
                        '${item.fat}g',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Unknown',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Alcohol: ',
                  style: TextStyle(fontSize: 18),
                ),
                item.alcohol != null
                    ? Text(
                        '${item.alcohol} g',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Unknown',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Size: ',
                  style: TextStyle(fontSize: 18),
                ),
                item.size != null
                    ? Text(
                        '${item.size}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Unknown',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
