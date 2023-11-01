// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product()
  ..id_product = json['id_product'] as num
  ..price = json['price'] as num
  ..name = json['name'] as String
  ..image = json['image'] as String;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id_product': instance.id_product,
      'price': instance.price,
      'name': instance.name,
      'image': instance.image,
    };
