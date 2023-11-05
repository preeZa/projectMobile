// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iorders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Iorders _$IordersFromJson(Map<String, dynamic> json) => Iorders()
  ..iorders = (json['iorders'] as List<dynamic>)
      .map((e) => Iorder.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$IordersToJson(Iorders instance) => <String, dynamic>{
      'iorders': instance.iorders,
    };
