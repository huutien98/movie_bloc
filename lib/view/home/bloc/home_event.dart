part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetListNowPlaying extends HomeEvent {}

class GetListGenres extends HomeEvent {}
