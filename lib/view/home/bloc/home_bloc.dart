import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc/service/now_playing_model/now_playing.dart';
import 'package:movie_bloc/util/app_logger.dart';

import '../../../service/repository/now_playing_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
 final NowPlayingRepository nowPlayingRepository;

  HomeBloc(this.nowPlayingRepository) : super(const HomeState()) {
    on<GetListNowPlaying>((event, emit) => getListNowPlaying(event, emit));
  }

  Future<void> getListNowPlaying(HomeEvent event, Emitter emitter) async {
    NowPlaying nowPlaying = await nowPlayingRepository.getListNowPlaying();
    logger.d("tiennh"+nowPlaying.results!.length.toString());
    if (nowPlaying.results != null) {
      emit(state.copyWith(
          status: HomeStatus.success, results: nowPlaying.results));
    } else {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
