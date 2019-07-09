import 'package:flutter/material.dart';

import 'CategoryAdapter.dart';
class ShowRoomPage extends StatefulWidget{
  @override
  _StateShowRoomPage  createState() => new _StateShowRoomPage();
}
class _StateShowRoomPage extends State<ShowRoomPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                child: CategoryAdapter(),
                onTap: (){
                  print("$index");
                },
              );
            }
        ),
      ),
    );
  }
}

