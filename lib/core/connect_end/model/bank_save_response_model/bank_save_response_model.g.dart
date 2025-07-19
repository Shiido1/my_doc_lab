// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_save_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankSaveResponseModel _$BankSaveResponseModelFromJson(
  Map<String, dynamic> json,
) => BankSaveResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BankSaveResponseModelToJson(
  BankSaveResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
