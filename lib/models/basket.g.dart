// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Basket _$BasketFromJson(Map<String, dynamic> json) => Basket()
  ..id_product = json['id_product'] as num
  ..image = json['image'] as String
  ..name = json['name'] as String
  ..amount = json['amount'] as num
  ..id_user = json['id_user'] as num
  ..price = json['price'] as num
  ..total = json['total'] as num;

Map<String, dynamic> _$BasketToJson(Basket instance) => <String, dynamic>{
      'id_product': instance.id_product,
      'image': instance.image,
      'name': instance.name,
      'amount': instance.amount,
      'id_user': instance.id_user,
      'price': instance.price,
      'total': instance.total,
    };
