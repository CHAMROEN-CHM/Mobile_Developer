// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

// The widget shall take as required parameter a Grocery

// 	Use a ListTile widget to layout the elements

// https://api.flutter.dev/flutter/material/ListTile-class.html


import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem groceryItem;

  const GroceryTile({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(color: groceryItem.category.color),
      ),
      title: Text(groceryItem.name),
      trailing: Text(groceryItem.quantity.toString()),
    );
  }
}
