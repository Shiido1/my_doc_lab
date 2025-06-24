// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_giver_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareGiverResponseModel _$CareGiverResponseModelFromJson(
        Map<String, dynamic> json) =>
    CareGiverResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CareGiverResponseModelToJson(
        CareGiverResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
