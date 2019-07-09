import 'package:dio/dio.dart';

import 'Config.dart';

class DioApi{
  Dio dio;
  String _baseUrl;
 DioApi(){
// or new Dio with a Options instance.
    _baseUrl = Config().Url;
    BaseOptions  options = new BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
  }
}