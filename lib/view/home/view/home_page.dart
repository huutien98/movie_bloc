import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/main_movie.dart';
import 'package:movie_bloc/service/now_playing_model/now_playing.dart';
import 'package:movie_bloc/util/app_logger.dart';
import 'package:movie_bloc/util/route/app_routing.dart';
import 'package:movie_bloc/view/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>()..getListNowPlaying,
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black54,
            onPressed: () {
              Navigator.of(context).pushNamed(RouteDefine.drawerMenu.name);
            },
          ),
          title: Text(
            "Movies".toUpperCase(),
            style: Theme
                .of(context)
                .textTheme
                .caption
                ?.copyWith(
                color: Colors.black54,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Muli'),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image/logo.jpeg'),
              ),
            )
          ],
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.status == HomeStatus.loading) {
                      return Center(
                        child: Platform.isAndroid
                            ? CircularProgressIndicator()
                            : CupertinoActivityIndicator(),
                      );
                    } else if (state.status == HomeStatus.success) {
                      List<Results>? movies = state.results;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(itemCount: movies?.length,
                            itemBuilder: (context, index, realIndex) {
                             return _itemBulder(context, index);
                            },
                            options: CarouselOptions(autoPlay: true),)
                        ],
                      );
                    }else{
                      return Scaffold();
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _itemBulder(BuildContext context, int index) {
    return GestureDetector(onTap: () {
      logger.d("tiennh");
    },);
  }
}
