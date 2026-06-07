// Ex 1 : The selectable button
import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String text = "Not Selected";
  Color color = Colors.black;
  Color bgColor = Colors.blue[50]!;

  onTap() {
    setState(() {
      text = "Selected";
      color = Colors.white;
      bgColor = Colors.blue[500]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: bgColor),
      child: Text(text, style: TextStyle(color: color)),
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
            SizedBox(
               width: 400, height: 100,
                  child: Select(),
               ),
            SizedBox(
               width: 400, height: 100,
                  child: Select(),
               ),
            SizedBox(
               width: 400, height: 100,
                  child: Select(),
               ),
          ],
        ),
        ),),
  ),
);
