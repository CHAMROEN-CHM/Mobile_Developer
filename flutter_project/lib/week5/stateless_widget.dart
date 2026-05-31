// // Ex 1: The hobbies
// import 'package:flutter/material.dart';

// class HobbyCard extends StatelessWidget {
//   final Color color;
//   final String label;
//   final IconData icons;
//   const HobbyCard({
//     super.key,
//     this.color = Colors.blue,
//     required this.label,
//     required this.icons,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(30),
//       width: 400,
//       height: 100,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icons, size: 30.0, color: Colors.blueAccent),
//           SizedBox(width: 20),
//           Text(
//             label,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.blue[600],
//           title: Text(
//             "My Hobbies",
//             style: TextStyle(
//               color: Colors.lightGreen,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(40),
//           decoration: BoxDecoration(
//             color: Colors.grey,
//           ),
//           child: Center(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               // crossAxisAlignment: CrossAxisAlignment.stretch,

//               children: [
//                 HobbyCard(
//                   color: Colors.green,
//                   label: "Travelling",
//                   icons: Icons.travel_explore_outlined,
//                 ),
//                 SizedBox(height: 10),
//                 HobbyCard(
//                   color: const Color.fromARGB(255, 74, 71, 71),
//                   label: "Skating",
//                   icons: Icons.skateboarding_outlined,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// // Ex 2: The buttons

// import 'package:flutter/material.dart';

// enum Button { primary, secondary, disable }

// class CustomButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final IconAlignment position;
//   final Button button;
//   const CustomButton({
//     super.key,
//     required this.label,
//     required this.icon,
//     required this.button,
//     this.position = IconAlignment.start,
//   });
//   Color getColor() {
//     switch (button) {
//       case Button.primary:
//         return Colors.blue;
//       case Button.secondary:
//         return Colors.green;
//       case Button.disable:
//         return Colors.blueGrey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: EdgeInsets.all(20),
//         width: double.infinity,
//         child: ElevatedButton.icon(
//           onPressed: () {},
//           iconAlignment: position,
//           style: ElevatedButton.styleFrom(backgroundColor: getColor()),
//           icon: Icon(icon),
//           label: Text(
//             label,
//             style: TextStyle(color: const Color.fromARGB(255, 205, 199, 254), fontSize: 30),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 75, 40, 231),
//           title: Text(
//             "Custom Button",
//             style: TextStyle(fontSize: 30, color: Colors.white),
//           ),
//         ),
//         body: Column(
//           children: [
//             CustomButton(
//               label: "Submit",
//               icon: Icons.check,
//               button: Button.primary,
//               position: IconAlignment.end,
//             ),
//             SizedBox(height: 20,),
//             CustomButton(label: "Time", icon: Icons.more_time, button: Button.secondary, position: IconAlignment.end),
//             SizedBox(height: 20,),
//             CustomButton(label: "Account", icon: Icons.account_tree_outlined, button: Button.disable, position: IconAlignment.end),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// // Ex 3: The products

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
        body: Container(
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
  );
}
