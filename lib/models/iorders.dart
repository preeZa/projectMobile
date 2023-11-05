import 'package:json_annotation/json_annotation.dart';
import "iorder.dart";
part 'iorders.g.dart';

@JsonSerializable()
class Iorders {
  Iorders();

  late List<Iorder> iorders;
  
  factory Iorders.fromJson(Map<String,dynamic> json) => _$IordersFromJson(json);
  Map<String, dynamic> toJson() => _$IordersToJson(this);
}
