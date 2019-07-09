import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_begin/model/HouseResponse.dart';
import 'package:flutter_begin/model/NewsResponse.dart';
import 'DioApi.dart';

class LifeStyleProvider extends DioApi {
  Future<NewsResponse> getAllNews (int page)async{
    String url = "GetAllNews.php?page=$page";
    try{
      Response response = await dio.get(url);
      print("${response.data}");
      Map rest = json.decode(response.data);
      return NewsResponse.fromJson(rest);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
  Future<HouseResponse> getAllHouse (int page)async{
    String url = "GetAllHouse.php?page=$page&class=0&area=0";
    try{
      Response response = await dio.get(url);
      print("${response.data}");
      Map rest = json.decode(response.data);
      return HouseResponse.fromJson(rest);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}