import 'package:flutter/material.dart';
import 'package:flutter_project/week6/EXERCISE_3/UI/SCREEN/temperature_screen.dart';
import 'UI/SCREEN/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool iswelcome = true;
  void switchScreen() {
    setState(() {
      iswelcome = false;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: iswelcome? WelcomeScreen(onTap: switchScreen,) : TemperatureScreen(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
