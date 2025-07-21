// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_giver_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareGiverRegistrationModel _$CareGiverRegistrationModelFromJson(
        Map<String, dynamic> json) =>
    CareGiverRegistrationModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CareGiverRegistrationModelToJson(
        CareGiverRegistrationModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
