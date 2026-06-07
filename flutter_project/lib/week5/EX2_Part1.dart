// EX 2 : The best cards

import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final bool isFavorite;
  const FavoriteCard({super.key, this.isFavorite = false});

  Color getColor() {
    if (isFavorite == true) {
      return Colors.red;
    } else {
      return const Color.fromARGB(255, 171, 169, 169);
    }
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
            onPressed: () => {},
            icon: Icon(Icons.favorite, color: getColor()),
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
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: true),
            FavoriteCard(),
          ],
        ),
      ),
    ),
  );
}
