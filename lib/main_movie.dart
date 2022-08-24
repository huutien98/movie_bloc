import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_bloc/app.dart';
import 'package:movie_bloc/observer_bloc/app_bloc_observer.dart';

import 'di/inject.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  BlocOverrides.runZoned(
    () async {
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}
