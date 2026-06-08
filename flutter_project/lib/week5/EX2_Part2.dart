// EX 2 : The best cards

import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isSelected = false;
  Color get getColor {
    if (isSelected) {
      return Colors.red;
    } else {
      return Color.fromARGB(255, 169, 171, 172);
    }
  }

  String get getLabel {
    if (isSelected) {
      return "Selected";
    } else {
      return "Is not Selected";
    }
  }

  void onTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10.0),
                Text('description'),
              ],
            ),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(Icons.favorite, color: getColor),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(),
            FavoriteCard(),
            FavoriteCard(),
            FavoriteCard(),
          ],
        ),
      ),
    ),
  );
}
