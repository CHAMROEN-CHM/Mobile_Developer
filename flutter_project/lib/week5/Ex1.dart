// Ex 1 : The selectable button
import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  bool isSelected = false;

  Color get getColor {
    if (isSelected) {
      return Colors.blue[500]!;
    } else {
      return Colors.blue[50]!;
    }
  }

  Color get labelColor {
    if (isSelected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  String get getLabel {
    if (isSelected) {
      return "Selected";
    } else {
      return "Not selected";
    }
  }

  void onTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: getColor),
      child: Text(getLabel, style: TextStyle(color: labelColor)),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 400, height: 100, child: Select()),
            SizedBox(width: 400, height: 100, child: Select()),
            SizedBox(width: 400, height: 100, child: Select()),
          ],
        ),
      ),
    ),
  ),
);
