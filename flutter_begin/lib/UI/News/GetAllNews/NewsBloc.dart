import 'package:flutter_begin/model/News.dart';
import 'package:flutter_begin/model/NewsResponse.dart';
import 'package:rxdart/rxdart.dart';

import 'NewsRepository.dart';
class NewsBloc{
  BehaviorSubject<List<News>> _news = BehaviorSubject();
  final NewsRepository _newsRepository = NewsRepository();
  List<News> _list =[];
  BehaviorSubject<List<News>> get news => _news;
  getAllNews(int page) async {
    NewsResponse newsResponse = await _newsRepository.getAllNews(page);
    if(newsResponse.list != null){
      _list.addAll(newsResponse.list);
      _news.sink.add(_list);
    }

  }
  dispose(){
    _news.close();
  }
}