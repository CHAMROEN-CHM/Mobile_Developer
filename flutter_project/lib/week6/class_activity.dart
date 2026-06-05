import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  String currentDice = "assets/dice-1.png";
  void onTap() {
    setState(() {
    var intValue = Random().nextInt(6) + 1;
    currentDice = "assets/dice-" + intValue.toString() + ".png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[300],
      child: Center(
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                Image.asset(currentDice, height: 200),
                SizedBox(height: 10),
                  TextButton(
                    onPressed: onTap,
                    child: Text(
                      "Roll the Dice",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
                    ),
          ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Dice())));
}
