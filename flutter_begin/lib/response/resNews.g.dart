// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resNews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

resNews _$resNewsFromJson(Map<String, dynamic> json) {
  return resNews((json['data'] as List)
      ?.map((e) => e == null ? null : News.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$resNewsToJson(resNews instance) =>
    <String, dynamic>{'data': instance.data};
