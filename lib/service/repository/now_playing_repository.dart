import 'dart:convert';

import 'package:movie_bloc/service/model/httpRaw.dart';
import 'package:movie_bloc/service/provider/network_factory.dart';
import 'package:movie_bloc/service/response/now_playing_model/now_playing.dart';

class NowPlayingRepository {
  final NetworkFactory _networkFactory;

  NowPlayingRepository(this._networkFactory);

  Future<NowPlaying> getListNowPlaying() async {
    HttpRawRes httpRawRes = await _networkFactory.getListNowPlaying();
    if (httpRawRes.data is String) {
      return NowPlaying.fromJson(jsonDecode(httpRawRes.data));
    } else {
      return NowPlaying.fromJson(httpRawRes.data);
    }
  }
}
