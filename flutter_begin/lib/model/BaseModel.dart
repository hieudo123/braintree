import 'package:json_annotation/json_annotation.dart';
part 'BaseModel.g.dart';
@JsonSerializable()
class BaseModel{
  @JsonKey(name: 'Success')
  int Success;
  BaseModel(this.Success);
  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

}