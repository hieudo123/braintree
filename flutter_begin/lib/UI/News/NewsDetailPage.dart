import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begin/model/ImageModel.dart';
import 'package:flutter_begin/model/News.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsDetailPage extends StatefulWidget {
  News news;
  String title;

  NewsDetailPage({Key key, this.news, this.title}) : super(key: key);

  @override
  _StateNewsDetail createState() => new _StateNewsDetail();
}

class _StateNewsDetail extends State<NewsDetailPage> {
  List jsonResponse;
  int _current =0;
  List imageList = [];
  var isLoading  = true;
  final Url = "https://androidwebsv.000webhostapp.com/hope/GetImageNews.php";
  Future<List> getData() async {
    List list = [];
    http.Response response = await http.get(this.Url + "?id=${widget.news.id}");
    var convertDataToJson = json.decode(response.body);
    jsonResponse = convertDataToJson["data"];
    list.addAll(jsonResponse);
    return list;
  }
  Future getImage() async {
    imageList.add(widget.news.image);
    await getData().then((value){
      for(int i =0 ; i < value.length;i++){
        setState(() {
          imageList.add(value[i]);
        });

      }
      setState(() {
        isLoading = false;
      });
      print("IMAGE : ${imageList.toString()}");
    });
  }
  String getTime(int time) {
    var date = DateTime.fromMillisecondsSinceEpoch(time);
    var formatter = new DateFormat("dd-MM-yyyy hh:mm:ss");

    return formatter.format(date);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false), // onBack :)
          );
        }),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if(isLoading)
               Container(
                 height: 300.0,
                 child: Center(
                   child: CircularProgressIndicator(),
                 ),
               )
            else
            CarouselSlider(
              onPageChanged: (index){
                setState(() {
                  _current = index;
                });
              },
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              height: 300.0,
              items: imageList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      child:
                        CachedNetworkImage(
                        imageUrl: "$i",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Center(child: new CircularProgressIndicator(),),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
//            new SizedBox(
//                height: 300.0,
//                width: double.infinity,
//                child: new Carousel(
//                  overlayShadow: true ,
//                  autoplay: true,
//                  autoplayDuration: Duration(seconds: 2),
//                  animationCurve: Curves.fastOutSlowIn,
//                  animationDuration: Duration(milliseconds: 2000),
//                  images: imageList,
//                  dotSize: 5,
//                  dotSpacing: 15.0,
//                  dotColor: Colors.lightBlue,
//                  indicatorBgPadding: 5.0,
//                  dotBgColor: Colors.purple.withOpacity(0.5),
//                )),
            Center(
              child: Container(
                width: 370.0,
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.news.tite,
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      getTime(widget.news.created_time),
                      style: TextStyle(fontSize: 14.0, color: Colors.black54),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.thumb_up, size: 30.0),
                              Text(
                                "${widget.news.like_counter}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.remove_red_eye, size: 30.0),
                              Text(
                                "${widget.news.view_counter}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.question_answer,
                                size: 30.0,
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 30.0,
                                color: Colors.lightBlueAccent,
                              ),
                              Text(
                                "Chia sẽ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Text(
                        widget.news.content,
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
