import 'package:json_annotation/json_annotation.dart';

part 'genres_models.g.dart';

@JsonSerializable()
class GenresList {
  @JsonKey(name: 'genres')
  final List<Genres>? genres;

  GenresList({this.genres});

  factory GenresList.fromJson(Map<String, dynamic> json) => _$GenresListFromJson(json);

  Map<String, dynamic> toJson() => _$GenresListToJson(this);
}

@JsonSerializable()
class Genres {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}