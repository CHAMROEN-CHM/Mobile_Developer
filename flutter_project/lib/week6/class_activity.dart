// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(color: Colors.green, height: 200),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(color: Colors.blue, height: 200),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(color: Colors.red, height: 1000),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//   );
// }

// --------------------------------------

// import 'package:flutter/material.dart';

// void main() {
//   void onPress() {
//     print("hello");
//   }

//   runApp(
//     MaterialApp(
//       title: 'My app',
//       home: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextButton(
//             onPressed: onPress,
//             child: const Text("Press me", style: TextStyle(fontSize: 50)),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// ------------------------------------

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  String currentDice = "assets/dice-1.png";
  void onTap() {
    setState(() {
      currentDice = "assets/dice-4.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[300],
      child: Center(
        child: Center(
          child: Column(
            children: [
              Image.asset(currentDice, height: 200),
              SizedBox(height: 10),
              TextButton(
                onPressed: onTap,
                child: Text(
                  "Roll the Dice",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: Dice())));
}
