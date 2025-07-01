// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paystack_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaystackData _$PaystackDataFromJson(Map<String, dynamic> json) => PaystackData(
  amount: json['amount'] as num?,
  email: json['email'] as String?,
  reference: json['reference'] as String?,
);

Map<String, dynamic> _$PaystackDataToJson(PaystackData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'email': instance.email,
      'reference': instance.reference,
    };
