// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

// The widget shall take as required parameter a Grocery

// 	Use a ListTile widget to layout the elements

// https://api.flutter.dev/flutter/material/ListTile-class.html

import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryTiles extends StatelessWidget {
  final GroceryCategory groceryCategory;
  final int amount;
  const GroceryTiles({
    super.key,
    required this.groceryCategory,
    this.amount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(color: groceryCategory.color),
      ),
      title: Text("groceryCategory.label"),
      trailing: Text(amount.toString()),
    );
  }
}
