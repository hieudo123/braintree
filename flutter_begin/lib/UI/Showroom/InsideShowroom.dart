import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget{

  @override
  _StateProductPage createState() => new _StateProductPage();
}
class _StateProductPage extends State<ProductPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Product",style: TextStyle(color: Colors.white,fontSize: 20.0),),
      ),
      body: new ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              print(index);
            },
            child: Card(
              elevation: 14.0,
              margin: EdgeInsets.only(top:30.0,left: 10.0,right: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Image.asset("assets/images/table.png",height: 140.0,width: 140.0,fit: BoxFit.cover,),
                  Expanded(
                    child: Container( 
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Sản phẩm",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20.0),),
                          Text("400.000",style: TextStyle(color: Colors.red,fontSize: 18.0),),
                          Text("I can finally ask a question to get my points up.In android studio,I want to be able to override the method",),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}