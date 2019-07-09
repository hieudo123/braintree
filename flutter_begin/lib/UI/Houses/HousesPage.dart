import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_begin/UI/Houses/itemHouse.dart';
import 'package:flutter_begin/model/AreaModel.dart';


import 'HouseBloc.dart';
class HousesPage extends StatefulWidget{

  @override
  _HousesPageState createState()=>new _HousesPageState();
}
class _HousesPageState extends State<HousesPage>{
  ScrollController scrollController = new ScrollController();
  final List<String> entries = <String>['A', 'B', 'C','D'];
  final Url ="https://androidwebsv.000webhostapp.com/hope/GetArea.php";
  final searchController = new TextEditingController();
  var bloc = HouseBloc();
  int page = 1;
  var isNotSearch = true;
  List jsonResponse;
  List<Area> areaList =[];
  Area selectedArea;
  Future getData() async{
    http.Response response = await http.get(this.Url);
    var convertDataToJson = json.decode(response.body);
    jsonResponse = convertDataToJson["data"];
    List<Area> areas = [];
    for (int i = 0; i < jsonResponse.length; i++){
      Area area = new Area.fromJson(jsonResponse[i]);
      areas.add(area);
    }
    setState(() {
      areaList.addAll(areas);
    });
  }
  showSearchIcon(String value){
     setState(() {

       if(value.length >0)
        isNotSearch = false;
       else
         isNotSearch = true;
     });
  }
  void clearSearchBox(){
    setState(() {
      searchController.clear();
      isNotSearch = true;
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    bloc.getAllHouse(page);
    scrollController.addListener((){
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        page +=1;
        bloc.getAllHouse(page);
        print("PAGE: $page");
      }
    });
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12,width: 0.5),
                        borderRadius:  BorderRadius.all(Radius.circular(8.0))
                    ),
                    width: double.infinity,
                    child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Visibility(
                              visible: isNotSearch,
                              child: Flexible(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.search)
                                ),
                                flex:1,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child:  TextField(
                                  controller: searchController,
                                  onChanged: showSearchIcon,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    hintText:"Search...",
                                  ),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  enabled: true,
                                  textInputAction: TextInputAction.search,
                                ),
                              ),
                              flex: 8,
                            ),
                            Visibility(
                              visible: isNotSearch?false :true,
                              child: Flexible(
                                child: GestureDetector(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.cancel,size: 15.0,)
                                  ),
                                  onTap:(){
                                    clearSearchBox();
                                  },
                                ),
                                flex:1,
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child:
                    new DropdownButton(
                      underline: Container(),
                      icon: Icon(Icons.arrow_drop_down_circle),
                      hint: new Text("Khu vực"),
                      isExpanded: true,
                      value: selectedArea,
                      items: areaList.map((Area item) {
                      return new DropdownMenuItem(
                      child: new Text(item.area_name),
                        value: item,
                      );
                      }).toList(),
                      onChanged: (Area newVal) {
                        setState(() {
                          selectedArea = newVal;
                          print("AREA ${newVal}");
                        });
                      },
                    )
                  ),
                  flex: 1,
                )
              ],
            ),
            StreamBuilder(
              stream: bloc.house.stream,
              builder: (context, snapshot) {
                if(snapshot.hasData)
                return Expanded(
                  child:ListView.builder(
                    controller: scrollController,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new GestureDetector(
                          child: HousesAdapter(snapshot.data[index]),
                          onTap: (){
                            print("$index");
                          },
                        );
                      }
                  ) ,
                );
                return Center(child: CircularProgressIndicator(),);
              }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.playlist_add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}