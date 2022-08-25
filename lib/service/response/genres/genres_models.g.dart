// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresList _$GenresListFromJson(Map<String, dynamic> json) => GenresList(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresListToJson(GenresList instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) => Genres(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
