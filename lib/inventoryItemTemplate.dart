import 'package:flutter/material.dart';
import 'package:hackathon2019/InventoryDetailScreen.dart';

class InventoryItem extends StatelessWidget {

  final String title;

  InventoryItem(
    this.title,
  );

void onItemPressed(BuildContext context ) {

    showModalBottomSheet(

        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 350,
            child: Container(
              child: buildDetailScreen(title),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40),
                  topRight: const Radius.circular(40),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemPressed(context);
        },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.all(5),
        child: Center(
        child:
          Text(title, style: TextStyle(
          color: Colors.black,
          fontSize: 18 )
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      ),
    );
  }
}