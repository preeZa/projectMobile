// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bills _$BillsFromJson(Map<String, dynamic> json) => Bills()
  ..bills = (json['bills'] as List<dynamic>)
      .map((e) => Bill.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BillsToJson(Bills instance) => <String, dynamic>{
      'bills': instance.bills,
    };
