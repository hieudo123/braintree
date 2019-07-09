import 'News.dart';

class NewsResponse {
  List<News> list;
  int success;
  NewsResponse({this.list, this.success});
  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    success: int.parse(json["Success"].toString()),
    list :(json["data"] as List)!=null ?(json["data"] as List).map((i)=> new News.fromJson(i)).toList():[]
  );
}