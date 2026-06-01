// Ex 3 : Column Gradient

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          color: Colors.blueGrey,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(40),
                ),
                margin: EdgeInsets.symmetric( vertical: 20.0, horizontal: 20.0,),
                padding: EdgeInsets.symmetric(horizontal: 235.0, vertical: 14.0,
                ),
                child: Text(
                  "OOP",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(40),
                ),
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 235.0, vertical: 14.0,
                ),
                child: Text(
                  "Dart",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 40.0,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(40),
                ),
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 220.0, vertical: 14.0,
                ),
                child: Text(
                  "Flutter",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
