import 'dart:convert';

import 'package:movie_bloc/service/model/httpRaw.dart';
import 'package:movie_bloc/service/provider/network_factory.dart';
import 'package:movie_bloc/service/response/genres/genres_models.dart';

class GenresRepository {
  final NetworkFactory _networkFactory;

  GenresRepository(this._networkFactory);

  Future<GenresList> getListGenres() async {
    HttpRawRes httpRawRes = await _networkFactory.getListGenres();
    if (httpRawRes.data is String) {
      return GenresList.fromJson(jsonDecode(httpRawRes.data));
    } else {
      return GenresList.fromJson(httpRawRes.data);
    }
  }
}
