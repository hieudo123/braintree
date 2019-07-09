import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begin/model/HouseModel.dart';
class HousesAdapter extends StatelessWidget{
  HouseModel _houseModel;
  HousesAdapter(this._houseModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 10.0,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: _houseModel.image,
            height: 248,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Giá",
                    style: TextStyle(fontSize: 18.0,color: Colors.lightBlue),),
                  Container(
                    margin: EdgeInsets.only(top: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 8.0),
                            child:  Row(
                              children: <Widget>[
                                Text("Diện tích",
                                  style: TextStyle(fontSize: 16.0,),),
                              ],
                            )
                        ),Container(
                            margin: EdgeInsets.only(top: 8.0),
                            child:  Row(
                              children: <Widget>[
                                Icon(Icons.compare),
                                Text("phòng",
                                  style: TextStyle(fontSize: 16.0,),),
                              ],
                            )
                        ),Container(
                            margin: EdgeInsets.only(top: 8.0),
                            child:  Row(
                              children: <Widget>[
                                Icon(Icons.location_on),
                                Text("phòng tắm",
                                  style: TextStyle(fontSize: 16.0,),),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child:  Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        Text("Địa chỉ",
                          style: TextStyle(fontSize: 16.0,),),
                      ],
                    )
                  ),
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
                        ),
                        Container(
                            child: Text("5/16/2019 3:58:45",)
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