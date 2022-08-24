import 'package:flutter/material.dart';
import 'package:movie_bloc/util/route/app_routing.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting.generateRoute,
      initialRoute: RouteDefine.home.name,
    );
  }
}
