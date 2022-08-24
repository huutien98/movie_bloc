part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus? status;
  final List<Results>? results;

  const HomeState({this.status = HomeStatus.initial, this.results}) : super();

  HomeState copyWith({HomeStatus? status, List<Results>? results}) {
    return HomeState(
        status: status ?? this.status, results: results ?? this.results);
  }

  @override
  String toString() {
    return 'HomeState{status: $status, results: $results}';
  }

  @override
  List<Object?> get props => [status, results];
}
