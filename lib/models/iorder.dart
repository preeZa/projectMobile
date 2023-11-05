import 'package:json_annotation/json_annotation.dart';

part 'iorder.g.dart';

@JsonSerializable()
class Iorder {
  Iorder();

  late String name;
  late String image;
  late num amount;
  late num sum;
  late num id_bill;
  
  factory Iorder.fromJson(Map<String,dynamic> json) => _$IorderFromJson(json);
  Map<String, dynamic> toJson() => _$IorderToJson(this);
}
