import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/main_movie.dart';
import 'package:movie_bloc/service/response/genres/genres_models.dart';
import 'package:movie_bloc/service/response/now_playing_model/now_playing.dart';
import 'package:movie_bloc/util/route/app_routing.dart';
import 'package:movie_bloc/view/home/bloc/home_bloc.dart';

import '../../../util/app_logger.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomePage extends StatefulWidget {
  final int selectedGenre;
  const HomePage({Key? key,this.selectedGenre = 28}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedGenre;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..getListNowPlaying()..getListGenres(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<Results>? movies = state.results;
          List<Genres>? genres = state.genres;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: _appBar(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nowPlayListItem(movies),
                genresItem(genres),
              ],
            ),
          );
        },
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          margin: EdgeInsets.only(top: 20),
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      .toList();

  Widget _appBar() {
    return AppBar(
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
        style: Theme.of(context).textTheme.caption?.copyWith(
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
    );
  }

  Widget nowPlayListItem(List<Results>? movies) {
    return CarouselSlider(
      items: movies?.length != 0
          ? movies?.map(
              (movie) {
                return Stack(
                  children: [
                    ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    Container(
                      child: Text(
                        movie.title.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.clip,
                            fontSize: 20),
                      ),
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(bottom: 7),
                    )
                  ],
                );
              },
            ).toList()
          : imageSliders,
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
    );
  }

  Widget genresItem(List<Genres>? genres) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                logger.d("tiennhclick"+index.toString());
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black45,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  genres![index].name.toString().toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'muli',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const VerticalDivider(
              color: Colors.transparent,
              width: 5,
            );
          },
          itemCount: genres?.toList().length ?? 0),
    );
  }
}
