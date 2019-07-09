import 'package:flutter_begin/Dio/life_style_provider.dart';
import 'package:flutter_begin/model/NewsResponse.dart';

class NewsRepository{
  LifeStyleProvider _lifeStyleProvider = LifeStyleProvider();
  Future<NewsResponse> getAllNews(int page){
    return _lifeStyleProvider.getAllNews(page);
  }
}