import 'package:flutter_begin/model/News.dart';
import 'package:json_annotation/json_annotation.dart';
part 'resNews.g.dart';
@JsonSerializable()
class resNews{
  @JsonKey(name: 'data')
  List<News> data;
  resNews(this.data);
  factory resNews.fromJson(Map<String, dynamic> json) =>_$resNewsFromJson(json);
  Map<String, dynamic> toJson() => _$resNewsToJson(this);
}