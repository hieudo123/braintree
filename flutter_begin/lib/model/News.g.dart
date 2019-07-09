// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      int.parse(json['Id']),
      json['Title'] as String,
      json['Content'] as String,
      json['Created_by'] as String,
      int.parse(json['Created_time']),
      json['Image'] as String,
      int.parse(json['View_counter']),
      int.parse(json['Like_counter']),
      int.parse(json['Status']));
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'Id': instance.id,
      'Title': instance.tite,
      'Content': instance.content,
      'Created_by': instance.created_by,
      'Created_time': instance.created_time,
      'Image': instance.image,
      'View_counter': instance.view_counter,
      'Like_counter': instance.like_counter,
      'Status': instance.status
    };
