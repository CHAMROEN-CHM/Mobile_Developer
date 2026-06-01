// Ex 1 : Scaffold, Text
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text(
          "This is my first app.",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 179, 137)),
        body: Center(

          child: Text(
            "Chamroen is the best!!",
            style: TextStyle(
              color: const Color.fromARGB(255, 185, 26, 26),
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
            )
          )
        ),
      ),
    ),
    );
}
