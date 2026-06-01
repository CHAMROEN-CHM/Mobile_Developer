// Ex 3: The products

import 'package:flutter/material.dart';

enum Product {
  dart("Dart", "The best object language", "assets/dart.png"),
  flutter("Flutter", "The best mobile widget library", "assets/flutter.png"),
  firebase("FireBase", "The best cloud Database", "assets/firebase.png");

  final String title;
  final String description;
  final String image;
  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;
  final String title;
  final String location;
  final String description;
  const ProductCard({
    super.key,
    required this.product,
    required this.title,
    required this.location,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.all(5),
          width: 400,
          height: 200,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(location, height: 50),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            "Products",
            style: TextStyle(
              color: const Color.fromARGB(255, 93, 2, 154),
              fontSize: 40,
              fontWeight: FontWeight.bold,
          ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: Center
            (child: Column(
              children: [
                ProductCard(product:Product.dart, title: Product.dart.title, location: Product.dart.image, description: Product.dart.description),
                SizedBox(height: 10,),
                ProductCard(product:Product.flutter, title: Product.flutter.title, location: Product.flutter.image, description: Product.flutter.description),
                SizedBox(height: 10,),
                ProductCard(product:Product.firebase, title: Product.firebase.title, location: Product.firebase.image, description: Product.firebase.description),
                SizedBox(height: 10,),
              ],
            )),
          ),
        ),
      ),
    ),
  );
}
