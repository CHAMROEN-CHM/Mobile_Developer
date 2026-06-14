class Joke {
  final String title;
  final String description;
  final bool isFavorite;
  const Joke({
    required this.title,
    required this.description,
    this.isFavorite = false
  });
}
