// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill()
  ..numberrow = json['numberrow'] as num
  ..id_bill = json['id_bill'] as num
  ..total = json['total'] as num;

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'numberrow': instance.numberrow,
      'id_bill': instance.id_bill,
      'total': instance.total,
    };
