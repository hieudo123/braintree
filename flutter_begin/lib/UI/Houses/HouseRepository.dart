import 'package:flutter_begin/Dio/life_style_provider.dart';
import 'package:flutter_begin/model/HouseResponse.dart';

class HouseRepository{
  LifeStyleProvider _lifeStyleProvider = LifeStyleProvider();
  Future<HouseResponse> getAllHouse(int page){
    return _lifeStyleProvider.getAllHouse(page);
  }
}