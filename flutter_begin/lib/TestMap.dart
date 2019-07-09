//import 'package:flutter/material.dart';
//import 'model/News.dart';
//class TestMap extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: "Demo",
//      home: MyHomePage(),
//    );
//  }
//}
//class MyHomePage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(title: Text("Demo"),),
//      body: FutureBuilder<List<News>>(future:fetchNews(),builder: (context,snapshot){
//        if(snapshot.hasError) print(snapshot.error);
//        return snapshot.hasData ? NewsList(newsList: snapshot.data,) : Center(child: CircularProgressIndicator());
//      }),
//    );
//  }
//}
//class NewsList extends StatelessWidget{
// final List<News> newsList;
//
//  const NewsList({Key key, this.newsList}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(itemCount: newsList.length ,itemBuilder: (context,item){
//      return Text(newsList[item].title);
//    });
//  }
//}