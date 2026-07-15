import 'package:flutter/material.dart';
import 'package:pre_test/1%20-%20START%20CODE/ui/scores_screen.dart';
import '../data/services/auth_service.dart';
import 'auth_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  AuthenticationService authService = AuthenticationService.instance;

  void onLogin() {
    setState(() {});
  }

  Widget get content {
    // if logged in -> Display ScoresScreen
    if (authService.isLoggedIn) {
      return ScoresScreen();
    } else {
      // otherwise -> DisplayAuthScreen
      return AuthScreen(onLogin: onLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
