import 'package:flutter/material.dart';

enum AppTabs { red, green, blue }

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs currentTap = AppTabs.red;

  void redScreen() {
    setState(() {
      currentTap = AppTabs.red;
    });
  }

  void blueScreen() {
    setState(() {
      currentTap = AppTabs.blue;
    });
  }

  void greenScreen() {
    setState(() {
      currentTap = AppTabs.green;
    });
  }

  Widget getScreen() {
    switch (currentTap) {
      case AppTabs.red:
        return RedScreen();
      case AppTabs.blue:
        return BlueScreen();
      case AppTabs.green:
        return GreenScreen();
    }
  }

  Widget get content {
    return getScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: redScreen,
              icon: Icon(Icons.home, color: Colors.red),
            ),
            IconButton(
              onPressed: blueScreen,
              icon: Icon(Icons.home, color: Colors.blueAccent),
            ),
            IconButton(
              onPressed: greenScreen,
              icon: Icon(Icons.home, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
