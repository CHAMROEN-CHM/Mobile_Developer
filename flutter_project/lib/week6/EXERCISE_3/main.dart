import 'package:flutter/material.dart';
import 'package:flutter_project/week6/EXERCISE_3/UI/SCREEN/byebye_screen.dart';
import 'package:flutter_project/week6/EXERCISE_3/UI/SCREEN/temperature_screen.dart';
import 'package:flutter_project/week6/EXERCISE_3/UI/SCREEN/welcome_screen.dart' show WelcomeScreen;

enum ScreenType { welcome, converter, byeBye }

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  ScreenType currentScreen = ScreenType.welcome;
  void goToWelcome() {
    setState(() {
      currentScreen = ScreenType.welcome;
    });
  }

  void goToConverter() {
    setState(() {
      currentScreen = ScreenType.converter;
    });
  }

  void goToBybye() {
    setState(() {
      currentScreen = ScreenType.byeBye;
    });
  }

  Widget getScreens() {
    switch (currentScreen) {
      case ScreenType.welcome:
        return WelcomeScreen(onNext: goToConverter);
      case ScreenType.converter:
        return TemperatureScreen(onNext: goToBybye);
      case ScreenType.byeBye:
        return ByeByeScreen();
    }
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
          child: getScreens()
        ),
      ),
    );
  }
}

void main() {
  runApp(TemperatureApp());
}
