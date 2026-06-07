// Ex 1: The hobbies
import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icons;
  const HobbyCard({
    super.key,
    this.color = Colors.blue,
    required this.label,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icons, size: 30.0, color: Colors.blueAccent),
          SizedBox(width: 20),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
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
          centerTitle: true,
          backgroundColor: Colors.blue[600],
          title: Text(
            "My Hobbies",
            style: TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(color: Colors.grey),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HobbyCard(
                  color: Colors.green,
                  label: "Travelling",
                  icons: Icons.travel_explore_outlined,
                ),
                SizedBox(height: 10),
                HobbyCard(
                  color: const Color.fromARGB(255, 74, 71, 71),
                  label: "Skating",
                  icons: Icons.skateboarding_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
