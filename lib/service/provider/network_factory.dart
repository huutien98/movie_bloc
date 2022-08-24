import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:movie_bloc/config/api.dart';
import 'package:movie_bloc/config/base_url.dart';
import 'package:movie_bloc/generated/l10n.dart';
import 'package:movie_bloc/service/model/httpRaw.dart';

class NetworkFactory {
  late Dio _dio;

  NetworkFactory({String urlBase = BaseUrl.BASE_URL_MOVIE}) {
    _dio = Dio(BaseOptions(
        baseUrl: urlBase,
        receiveTimeout: 20000,
        connectTimeout: 20000,
        contentType: "application/json"));
  }

  Future<HttpRawRes> get(String url,
      [Map<String, dynamic>? queryParameters]) async {
    return await requestApi(_dio.get(url, queryParameters: queryParameters));
  }

  Future<HttpRawRes> requestApi(Future<Response> request) async {
    try {
      Response response = await request;
      return HttpRawRes(
          isSuccess: response.statusCode == 200 ? true : false,
          data: response.data,
          httpCode: response.statusCode);
    } catch (error) {
      // logger.e("Exception occurred: ${error.toString()}");
      return _handleError(error);
    }
  }

  HttpRawRes _handleError(dynamic error) {
    HttpRawRes httpRawRes = HttpRawRes()..isSuccess = false;
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          httpRawRes.data = S.current.request_send_timeout;
          break;
        case DioErrorType.cancel:
          httpRawRes.data = S.current.request_cancelled;
          break;
        case DioErrorType.connectTimeout:
          httpRawRes.data = S.current.request_connect_timeout;
          break;
        case DioErrorType.other:
          httpRawRes.data = S.current.request_fail_due_internet;
          break;
        case DioErrorType.receiveTimeout:
          httpRawRes.data = S.current.request_receive_timeout;
          break;
        case DioErrorType.response:
          httpRawRes.httpCode = error.response?.statusCode;
          httpRawRes.data = error.response?.data;
          break;
        default:
          httpRawRes.data = S.current.error;
      }
    } else {
      httpRawRes.data = S.current.error;
    }
    return httpRawRes;
  }

  Future<HttpRawRes> download(
      String urlPath,
      savePath, {
        ProgressCallback? onReceiveProgress,
        Map<String, dynamic>? queryParameters,
        bool deleteOnError = true,
      }) async {
    try {
      var response = await Dio().download(urlPath, savePath,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          deleteOnError: deleteOnError);
      return HttpRawRes(
          isSuccess: response.statusCode == 200 ? true : false,
          data: response.data,
          httpCode: response.statusCode);
    } catch (error) {
      // logger.e("Exception occurred: ${error.toString()}");
      return _handleError(error);
    }
  }

  Future<HttpRawRes> post(String url,
      {dynamic data, Map<String, dynamic>? queries}) async {
    return await requestApi(
        _dio.post(url, data: data, queryParameters: queries));
  }

  Future<HttpRawRes> put(String url, [Map<String, dynamic>? data]) async {
    if (!(await checkConnection())) {
      return HttpRawRes()..isSuccess = false;
    }
    return await requestApi(_dio.put(url, data: data));
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return !(connectivityResult == ConnectivityResult.none);
  }

  Future<HttpRawRes> delete(String url,
      [Map<String, dynamic>? queryParameters]) async {
    if (!(await checkConnection())) {
      return HttpRawRes()..isSuccess = false;
    }
    return await requestApi(_dio.delete(url, queryParameters: queryParameters));
  }

  Future<HttpRawRes> getListNowPlaying() async {
    return await requestApi(_dio.get(API.list_now_playing));
  }
}
