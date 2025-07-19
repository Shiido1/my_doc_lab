// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_stack_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayStackPaymentModel _$PayStackPaymentModelFromJson(
  Map<String, dynamic> json,
) => PayStackPaymentModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  paystackData:
      json['paystackData'] == null
          ? null
          : PaystackData.fromJson(json['paystackData'] as Map<String, dynamic>),
  authorizationUrl: json['authorization_url'] as String?,
);

Map<String, dynamic> _$PayStackPaymentModelToJson(
  PayStackPaymentModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'paystackData': instance.paystackData,
  'authorization_url': instance.authorizationUrl,
};
