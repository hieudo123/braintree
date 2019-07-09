import 'package:json_annotation/json_annotation.dart';
part 'News.g.dart';
@JsonSerializable()
class News{
  @JsonKey(name: 'Id')
  int id;
  @JsonKey(name: 'Title')
  String tite;
  @JsonKey(name: 'Content')
  String content;
  @JsonKey(name: 'Created_by')
  String created_by;
  @JsonKey(name: 'Created_time')
  int created_time;
  @JsonKey(name: 'Image')
  String image;
  @JsonKey(name: 'View_counter')
  int view_counter;
  @JsonKey(name: 'Like_counter')
  int like_counter;
  @JsonKey(name: 'Status')
  int status;
  News(this.id, this.tite, this.content, this.created_by, this.created_time,
      this.image, this.view_counter, this.like_counter, this.status);
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}


//import 'dart:convert';
//import 'package:dio/dio.dart';
//Future <List<News>> fetchNews() async{
//  Dio dio = new Dio();
//  Response response = await dio.get("https://androidwebsv.000webhostapp.com/hope/GetAllNews.php?page=1");
//}
//List<News> parseNews(List reponseJson){
//  return reponseJson.map<News>((jon))=>
//}
//class New {
//  int success;
//  List<News> data;
//
//  New({this.success, this.data});
//
//  New.fromJson(Map<String, dynamic> json) {
//    success = json['Success'];
//    if (json['data'] != null) {
//      data = new List<News>();
//      json['data'].forEach((v) {
//        data.add(new News.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['Success'] = this.success;
//    if (this.data != null) {
//      data['data'] = this.data.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class News {
//  String id;
//  String viewCounter;
//  String likeCounter;
//  String title;
//  String content;
//  String createdBy;
//  String createdTime;
//  String image;
//  String status;
//
//  News(
//      {this.id,
//        this.viewCounter,
//        this.likeCounter,
//        this.title,
//        this.content,
//        this.createdBy,
//        this.createdTime,
//        this.image,
//        this.status});
//
//  News.fromJson(Map<String, dynamic> json) {
//    id = json['Id'];
//    viewCounter = json['View_counter'];
//    likeCounter = json['Like_counter'];
//    title = json['Title'];
//    content = json['Content'];
//    createdBy = json['Created_by'];
//    createdTime = json['Created_time'];
//    image = json['Image'];
//    status = json['Status'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['Id'] = this.id;
//    data['View_counter'] = this.viewCounter;
//    data['Like_counter'] = this.likeCounter;
//    data['Title'] = this.title;
//    data['Content'] = this.content;
//    data['Created_by'] = this.createdBy;
//    data['Created_time'] = this.createdTime;
//    data['Image'] = this.image;
//    data['Status'] = this.status;
//    return data;
//  }
//}