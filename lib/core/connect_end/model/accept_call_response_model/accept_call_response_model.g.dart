// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_call_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptCallResponseModel _$AcceptCallResponseModelFromJson(
        Map<String, dynamic> json) =>
    AcceptCallResponseModel(
      message: json['message'] as String?,
      call: json['call'] == null
          ? null
          : Call.fromJson(json['call'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptCallResponseModelToJson(
        AcceptCallResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'call': instance.call,
    };
