import 'package:flutter/material.dart';
import 'package:flutter_project/Week9/EXERCISES/EX1/model/model.dart';

class MyButton extends StatelessWidget {
  final ButtonData data;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.data, required this.onPressed});

  Color bgColor() {
    if (data.isselected) {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 80,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: bgColor()),
          child: Text(data.name, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
