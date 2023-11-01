// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id_user = json['id_user'] as num
  ..username = json['username'] as String
  ..name = json['name'] as String
  ..phone = json['phone'] as String
  ..addres = json['addres'] as String
  ..image = json['image'] as String
  ..password = json['password'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id_user': instance.id_user,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'addres': instance.addres,
      'image': instance.image,
      'password': instance.password,
    };
