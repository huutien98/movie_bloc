import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NowPlaying {
  @JsonKey(name: 'app_version_android')
  final Dates? dates;
  @JsonKey(name: 'app_version_android')
  final int? page;
  @JsonKey(name: 'app_version_android')
  final List<Results>? results;
  @JsonKey(name: 'app_version_android')
  final int? totalPages;
  @JsonKey(name: 'app_version_android')
  final int? totalResults;

  const NowPlaying(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  factory NowPlaying.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingToJson(this);
}

@JsonSerializable()
class Dates {
  @JsonKey(name: 'app_version_android')
  final String? maximum;
  @JsonKey(name: 'app_version_android')
  final String? minimum;

  const Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}

@JsonSerializable()
class Results {
  @JsonKey(name: 'app_version_android')
  final bool? adult;
  @JsonKey(name: 'app_version_android')
  final String? backdropPath;
  @JsonKey(name: 'app_version_android')
  final List<int>? genreIds;
  @JsonKey(name: 'app_version_android')
  final int? id;
  @JsonKey(name: 'app_version_android')
  final String? originalLanguage;
  @JsonKey(name: 'app_version_android')
  final String? originalTitle;
  @JsonKey(name: 'app_version_android')
  final String? overview;
  @JsonKey(name: 'app_version_android')
  final double? popularity;
  @JsonKey(name: 'app_version_android')
  final String? posterPath;
  @JsonKey(name: 'app_version_android')
  final String? releaseDate;
  @JsonKey(name: 'app_version_android')
  final String? title;
  @JsonKey(name: 'app_version_android')
  final bool? video;
  @JsonKey(name: 'app_version_android')
  final double? voteAverage;
  @JsonKey(name: 'app_version_android')
  final int? voteCount;

  const Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
