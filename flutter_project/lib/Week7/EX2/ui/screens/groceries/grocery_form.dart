// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

import 'package:flutter/material.dart';
import 'package:flutter_project/Week7/EX2/models/grocery.dart';

class GroceryForm extends StatefulWidget {
  final void Function(GroceryItem groceryItem) addGrocery;
  const GroceryForm({super.key, required this.addGrocery});
  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  TextEditingController labelController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    labelController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void onReset() {
    Navigator.pop(context);
  }

  void onAddItem() {
    final quant = int.tryParse(quantityController.text);
    GroceryItem groceryItem = GroceryItem(
      name: labelController.text,
      quantity: quant!,
      category: GroceryCategory.meat,
    );
    widget.addGrocery(groceryItem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: labelController,
              decoration: InputDecoration(label: Text("Name")),
            ),
            SizedBox(height: 15),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(label: Text("Quantity")),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onReset,
                  child: Text("Cancel", style: TextStyle(color: Colors.blue)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onAddItem,
                  child: Text(
                    "Add Item",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
