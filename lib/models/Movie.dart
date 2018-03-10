import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import './genre.dart';
part 'movie.g.dart';

@JsonSerializable()
@immutable
class Movie extends Object with _$MovieSerializerMixin {
  Movie({
    @required this.title,
    @required this.description,
    @required this.rating,
    @required this.releaseDate,
    @required this.genres,
    @required this.imageUrl,
  });

  final String title;
  @JsonKey(name: 'overview')
  final String description;
  @JsonKey(name: 'vote_average')
  final double rating;
  @JsonKey(name: 'poster_path')
  final String imageUrl;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  final List<Genre> genres;
  
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
