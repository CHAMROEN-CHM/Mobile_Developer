import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Color start;
  final Color end;

  const MyButton({
    super.key,
    required this.label,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [start, end]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// VOid main

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            MyButton(label: "OOP", start: Colors.purple[400]!, end: Colors.purple[600]!),
            MyButton(label: "Dart", start: Colors.blue[400]!, end: Colors.blue[600]!),
            MyButton(label: "Dart", start: Colors.pink[400]!, end: Colors.pink[600]!),

            ],
        ),
      ),
    ),
  );
}
