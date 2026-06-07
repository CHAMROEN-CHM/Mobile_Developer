// Ex 2:  Container, Insets, BoxDecoration

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      margin: EdgeInsets.all(50),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[300],
      ),
      child: Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(15)
        ),
        child : Center(
          child: Text(
            "CADT Students",
            style: TextStyle(
              color: Colors.red,
              fontSize: 25.0,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      ),
    )
    );
}
