part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus? status;
  final List<Results>? results;
  final List<Genres>? genres;

  const HomeState({this.status = HomeStatus.initial, this.results, this.genres})
      : super();

  HomeState copyWith(
      {HomeStatus? status, List<Results>? results, List<Genres>? genres}) {
    return HomeState(
        status: status ?? this.status,
        results: results ?? this.results,
        genres: genres ?? this.genres);
  }

  @override
  String toString() {
    return 'HomeState{status: $status, results: $results}';
  }

  @override
  List<Object?> get props => [status, results, genres];
}
