// Ex 2: The buttons

import 'package:flutter/material.dart';

enum Button { primary, secondary, disable }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconAlignment position;
  final Button button;
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.button = Button.primary,
    this.position = IconAlignment.start,
  });
  Color getColor() {
    switch (button) {
      case Button.primary:
        return Colors.blue;
      case Button.secondary:
        return Colors.green;
      case Button.disable:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {},
          iconAlignment: position,
          style: ElevatedButton.styleFrom(backgroundColor: getColor()),
          icon: Icon(icon),
          label: Text(
            label,
            style: TextStyle(color: const Color.fromARGB(255, 205, 199, 254), fontSize: 30),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 75, 40, 231),
          title: Text(
            "Custom Button",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            CustomButton(
              label: "Devid",
              icon: Icons.check,
              button: Button.primary,
              position: IconAlignment.end,
            ),
            SizedBox(height: 20,),
            CustomButton(label: "Time",button: Button.secondary, icon: Icons.more_time, position: IconAlignment.start),
            SizedBox(height: 20,),
            CustomButton(label: "Account", icon: Icons.account_tree_outlined, button: Button.disable, position: IconAlignment.end),
          ],
        ),
      ),
    ),
  );
}
