import 'package:flutter/material.dart';

import 'InsideShowroom.dart';
class CategoryAdapter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.only(top: 8.0),
      elevation: 3.0,
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/living_room.png",height: 248.0,width: double.infinity,fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Phòng khách",style: TextStyle(fontSize: 20.0),),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(30.0),
                    border: new Border.all(
                      width: 5.0,
                      color: Colors.lightBlueAccent,
                    ),
                    color: Colors.lightBlueAccent
                  ),
                  child: IconButton(
                      icon: Icon(Icons.arrow_forward , color: Colors.white,),
                      onPressed:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductPage()),);
                  }),
                )
              ],
            ),
          )
        ],
      )
    );
  }

}