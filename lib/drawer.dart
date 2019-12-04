import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

Widget buildListTile(String title, IconData icon){
  return ListTile(
              leading: Icon(icon, size: 28,),
              title: Text(title, style: TextStyle(
              fontSize: 24),
              ),
              onTap: () { },
              ); 
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Navigation',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).accentColor,
              ),),
            ),
            SizedBox(height: 20,),
            buildListTile('Inventory', Icons.book),
        ],
      ),
      );
  }
}