class Joke {
  final String title;
  final int jokeID;
  final String description;
  final bool isFavorite;
  const Joke({
    required this.title,
    required this.description,
    required this.jokeID,
    this.isFavorite = false,
  });
}
