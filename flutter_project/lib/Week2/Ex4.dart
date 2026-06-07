// Ex: 4 : Create your welcome page
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(218, 206, 6, 63),
          centerTitle: true,
          title: Text(
            "Welcome to my Hobbies App!",
            style: TextStyle(
              color: const Color.fromARGB(255, 1, 1, 1),
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 300.0,
                    margin: EdgeInsets.all(10),
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 174, 9, 9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "My hobbies",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 250,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 173, 13, 13),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Football",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 173, 13, 13),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Basketball",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15.0),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 250,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 173, 13, 13),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Table Tennis",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 173, 13, 13),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Reading",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: 250.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 48, 47, 47),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(40),
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        
      ),
      
    ),
  );
}
