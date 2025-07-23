// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_specialization_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpecializationResponseModel _$GetSpecializationResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSpecializationResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['status_code'] as num?,
    );

Map<String, dynamic> _$GetSpecializationResponseModelToJson(
        GetSpecializationResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'status_code': instance.statusCode,
    };
