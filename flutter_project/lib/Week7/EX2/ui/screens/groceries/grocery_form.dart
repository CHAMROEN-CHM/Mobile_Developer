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

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});
  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  TextEditingController labelController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    labelController.dispose();
    quantityController.dispose();
  }

  void onReset() {
    Navigator.pop(context);
  }

  void onAddItem() {
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
                  child: Text("Reset", style: TextStyle(color: Colors.blue)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onAddItem,
                  child: Text(
                    "Add Items",
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
