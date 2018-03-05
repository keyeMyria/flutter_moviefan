import 'package:meta/meta.dart';

class Movie {
  Movie({
    @required this.title,
    @required this.description,
    @required this.rating,
    @required this.duration,
    @required this.genre,
    @required this.imageUrl,
  });

  final String title;
  final String description;
  final String rating;
  final String duration;
  final String imageUrl;
  final List<String> genre;
}
