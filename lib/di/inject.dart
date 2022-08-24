import 'package:movie_bloc/main_movie.dart';
import 'package:movie_bloc/service/provider/network_factory.dart';
import 'package:movie_bloc/service/repository/now_playing_repository.dart';
import 'package:movie_bloc/view/home/bloc/home_bloc.dart';

Future<void> setupGetIt() async {
  getIt.registerLazySingleton(() => NetworkFactory());

  getIt.registerLazySingleton(() => NowPlayingRepository(getIt()));

  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));
}
