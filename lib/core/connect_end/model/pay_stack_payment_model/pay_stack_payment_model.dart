import 'package:json_annotation/json_annotation.dart';

import 'paystack_data.dart';

part 'pay_stack_payment_model.g.dart';

@JsonSerializable()
class PayStackPaymentModel {
  String? status;
  String? message;
  PaystackData? paystackData;
  @JsonKey(name: 'authorization_url')
  String? authorizationUrl;

  PayStackPaymentModel({
    this.status,
    this.message,
    this.paystackData,
    this.authorizationUrl,
  });

  factory PayStackPaymentModel.fromJson(Map<String, dynamic> json) {
    return _$PayStackPaymentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PayStackPaymentModelToJson(this);
}
