// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['Id'].toString(),
      json['Username'] as String,
      json['Password'] as String,
      json['Email'] as String,
      json['Address'] as String,
      json['Image'] as String,
      int.parse(json['Gender'].toString()),
      int.parse(json['Status'].toString())
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.id,
      'Username': instance.username,
      'Password': instance.password,
      'Email': instance.email,
      'Address': instance.address,
      'Image': instance.image,
      'Gender': instance.gender,
      'Status': instance.status
    };
