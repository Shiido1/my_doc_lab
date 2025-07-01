// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  accountNumber: json['account_number'] as String?,
  bankCode: json['bank_code'] as String?,
  accountName: json['account_name'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'account_number': instance.accountNumber,
  'bank_code': instance.bankCode,
  'account_name': instance.accountName,
};
