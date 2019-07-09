import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name: 'Id')
  String id;
  @JsonKey(name: 'Username')
  String username;
  @JsonKey(name: 'Password')
  String password;
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Address')
  String address;
  @JsonKey(name: 'Image')
  String image;
  @JsonKey(name: 'Gender')
  int gender;
  @JsonKey(name: 'Status')
  int status;

  User(this.id, this.username, this.password, this.email, this.address,
      this.image, this.gender, this.status);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}
