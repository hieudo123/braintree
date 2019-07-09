import 'package:flutter/material.dart';
import 'package:flutter_begin/model/News.dart';
import 'package:flutter_begin/response/resNews.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_begin/UI/News/GetAllNews/itemNews.dart';
import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

import '../CreateNews.dart';
import '../NewsDetailPage.dart';
import 'NewsBloc.dart';

class NewsPage extends StatefulWidget{

  @override
  _NewsPageState createState()=>new _NewsPageState();
}
class _NewsPageState extends State<NewsPage>{
  var bloc = NewsBloc();
  var inProgress = true;
  int page = 1;
  var isLoading =false;
  final List<String> entries = <String>['A', 'B', 'C','D'];
  List jsonResponse;
  List<News> list =[];
  ScrollController scrollController = new ScrollController();
  void changeWidget(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>CreateNewsPage(title: "Đăng bài viết",)));
  }
  getData(int page){
    bloc.getAllNews(page);
//    if(!isLoading){
//     setState(() {
//       isLoading =true;
//     });
//    }
//    var Url ="https://androidwebsv.000webhostapp.com/hope/GetAllNews.php?page=$page";
//    http.Response response = await http.get(Url);
//    setState(() {
//      var convertDataToJson = json.decode(response.body);
//      if(convertDataToJson["Success"]==1){
//        jsonResponse = convertDataToJson["data"];
//        Map userMap = jsonDecode(response.body);
//        var listNews = resNews.fromJson(userMap);
//        for(int i = 0; i < listNews.data.length; i++){
//          News news = listNews.data[i];
//          list.add(news);
//        }
//      }
//      inProgress = false;
//      isLoading =false;
//    });

  }
  @override
  void dispose() {
    bloc.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData(page);
    scrollController.addListener((){
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        page +=1;
        getData(page);
        print("PAGE: $page");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(
        child: StreamBuilder(
          stream: bloc.news.stream,
          builder: (context, snapshot) {
            if(snapshot.hasData)
            return ListView.builder(
              addAutomaticKeepAlives: true,
              controller: scrollController,
                padding: const EdgeInsets.all(8.0),
                itemCount: snapshot.data.length +1,
                itemBuilder: (BuildContext context, int index) {
                if(index < snapshot.data.length)
                  return new GestureDetector(
                    child: NewsAdapter(snapshot.data[index]),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>NewsDetailPage(news: snapshot.data[index],title: "Tin Tức",)));
                    },
                  );
                }
            );
            return Center(child: CircularProgressIndicator());
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          changeWidget();
        },
        child: Icon(Icons.playlist_add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}