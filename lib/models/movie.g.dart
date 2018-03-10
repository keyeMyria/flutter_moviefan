// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => new Movie(
    title: json['title'] as String,
    description: json['overview'] as String,
    rating: (json['vote_average'] as num)?.toDouble(),
    releaseDate: json['release_date'] as String,
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : new Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageUrl: json['poster_path'] as String);

abstract class _$MovieSerializerMixin {
  String get title;
  String get description;
  double get rating;
  String get imageUrl;
  String get releaseDate;
  List<Genre> get genres;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'overview': description,
        'vote_average': rating,
        'poster_path': imageUrl,
        'release_date': releaseDate,
        'genres': genres
      };
}
