import 'package:flutter/material.dart';
import 'package:flutter_begin/model/News.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NewsAdapter extends StatelessWidget{
  News news;
  NewsAdapter(this.news);
  String getTime(){
    var date = DateTime.fromMillisecondsSinceEpoch(news.created_time);
    var formatter = new DateFormat("dd-MM-yyyy hh:mm:ss");

    return formatter.format(date);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.only(top:10),
      elevation: 3.0,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: news.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(news.tite,
                    style: TextStyle(fontSize: 17.0,),),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    color: Colors.blueAccent,
                    width: double.infinity,
                    height: 1.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width:100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("${news.like_counter}",style: TextStyle(fontSize: 14.0,),),
                                  Icon(Icons.thumb_up,size: 15.0)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("${news.view_counter}",style: TextStyle(fontSize: 14.0,),),
                                  Icon(Icons.remove_red_eye,size: 15.0)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("0",style: TextStyle(fontSize: 14.0,),),
                                  Icon(Icons.question_answer,size: 15.0,)
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            child: Text(getTime())
                        )
                      ],
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

}