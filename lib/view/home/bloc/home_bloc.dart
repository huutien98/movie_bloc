import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc/service/repository/genres_repository.dart';
import 'package:movie_bloc/service/repository/now_playing_repository.dart';
import 'package:movie_bloc/service/response/genres/genres_models.dart';
import 'package:movie_bloc/service/response/now_playing_model/now_playing.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NowPlayingRepository nowPlayingRepository;
  final GenresRepository genresRepository;

  HomeBloc(this.nowPlayingRepository, this.genresRepository)
      : super(const HomeState()) {
    on<GetListNowPlaying>((event, emit) => getListNowPlaying());
    on<GetListGenres>((event, emit) => getListGenres());
  }

  Future<void> getListNowPlaying() async {
    emit(state.copyWith(status: HomeStatus.initial));
    NowPlaying nowPlaying = await nowPlayingRepository.getListNowPlaying();
    emit(state.copyWith(status: HomeStatus.loading));
    if (nowPlaying.results != null) {
      emit(state.copyWith(
          status: HomeStatus.success, results: nowPlaying.results));
    } else {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> getListGenres() async {
    emit(state.copyWith(status: HomeStatus.initial));
    GenresList genresList = await genresRepository.getListGenres();
    emit(state.copyWith(status: HomeStatus.loading));
    if (genresList.genres != null) {
      emit(state.copyWith(
          status: HomeStatus.success, genres: genresList.genres));
    } else {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
