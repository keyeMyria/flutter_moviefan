import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
@immutable
class Genre extends Object with _$GenreSerializerMixin {
  Genre({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;
  
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
