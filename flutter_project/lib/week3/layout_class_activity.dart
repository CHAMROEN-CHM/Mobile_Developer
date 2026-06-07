import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 300.0,
                decoration: BoxDecoration(color: Colors.amber),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 197, 36, 89),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(color: Colors.amber),
                    ),
                  ),
                  SizedBox(width: 50),

                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(color: Colors.amber),
                    ),
                  ),
                  SizedBox(width: 50),

                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(color: Colors.amber),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.pink[200]),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
