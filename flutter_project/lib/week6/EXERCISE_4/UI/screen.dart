import 'package:flutter/material.dart';
import '../Data/data.dart';

Color appColor = Colors.green[300] as Color;

class CardBox extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;
  final bool isFavorite;
  const CardBox({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          title: Text(title, style: TextStyle(color: appColor)),
          subtitle: Text(description),
          trailing: IconButton(
            onPressed: onTap,
            icon: Icon(Icons.favorite),
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class FavoriteCardsList extends StatefulWidget {
  const FavoriteCardsList({super.key});

  @override
  State<FavoriteCardsList> createState() => _FavoriteCardsListState();
}

class _FavoriteCardsListState extends State<FavoriteCardsList> {
  int favID = -1;
  void onTap(int id) {
    setState(() {
      favID = id;
    });
  }

  bool isfav(int jokeId) {
    if (favID == jokeId) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView(
        children: [
          ...jokeList.map((items) {
            return CardBox(
              title: items.title,
              description: items.description,
              isFavorite: isfav(items.jokeID),
              onTap: () => onTap(items.jokeID),
            );
          }),
        ],
      ),
    );
  }
}
