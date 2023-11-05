// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iorder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Iorder _$IorderFromJson(Map<String, dynamic> json) => Iorder()
  ..name = json['name'] as String
  ..image = json['image'] as String
  ..amount = json['amount'] as num
  ..sum = json['sum'] as num
  ..id_bill = json['id_bill'] as num;

Map<String, dynamic> _$IorderToJson(Iorder instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'amount': instance.amount,
      'sum': instance.sum,
      'id_bill': instance.id_bill,
    };
