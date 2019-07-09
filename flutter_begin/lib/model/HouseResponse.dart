import 'HouseModel.dart';

class HouseResponse{
  List<HouseModel> list;
  int success;
  HouseResponse({this.list, this.success});
  factory HouseResponse.fromJson(Map<String, dynamic> json) => HouseResponse(
      success: int.parse(json["Success"].toString()),
      list :(json["data"] as List)!=null?(json["data"] as List).map((i)=> new HouseModel.fromJson(i)).toList():[]
  );
}