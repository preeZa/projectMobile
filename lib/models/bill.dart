import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill {
  Bill();

  late num numberrow;
  late num id_bill;
  late num total;
  
  factory Bill.fromJson(Map<String,dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}
