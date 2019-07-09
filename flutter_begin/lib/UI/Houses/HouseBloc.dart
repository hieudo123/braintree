import 'package:flutter_begin/model/HouseModel.dart';
import 'package:flutter_begin/model/HouseResponse.dart';
import 'package:rxdart/rxdart.dart';

import 'HouseRepository.dart';
class HouseBloc {
  BehaviorSubject<List<HouseModel>> _house = BehaviorSubject();
  final HouseRepository _houseRepository = HouseRepository();
  BehaviorSubject<List<HouseModel>> get house => _house;
  List<HouseModel> _list =[];
  getAllHouse(int page)async{
    HouseResponse houseResponse = await _houseRepository.getAllHouse(page);
    if(houseResponse.list != null){
    _list.addAll(houseResponse.list);
    _house.sink.add(_list);
    }
  }
  dispose(){
    _house.close();
  }
}