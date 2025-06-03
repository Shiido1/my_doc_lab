import 'package:json_annotation/json_annotation.dart';

part 'paystack_data.g.dart';

@JsonSerializable()
class PaystackData {
  num? amount;
  String? email;
  String? reference;

  PaystackData({this.amount, this.email, this.reference});

  factory PaystackData.fromJson(Map<String, dynamic> json) {
    return _$PaystackDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaystackDataToJson(this);
}
