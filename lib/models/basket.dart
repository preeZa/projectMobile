import 'package:json_annotation/json_annotation.dart';

part 'basket.g.dart';

@JsonSerializable()
class Basket {
  Basket();

  late num id_product;
  late String image;
  late String name;
  late num amount;
  late num id_user;
  late num price;
  late num total;
  
  factory Basket.fromJson(Map<String,dynamic> json) => _$BasketFromJson(json);
  Map<String, dynamic> toJson() => _$BasketToJson(this);
}
