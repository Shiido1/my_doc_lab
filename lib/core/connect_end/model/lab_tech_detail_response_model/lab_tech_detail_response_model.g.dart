// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_tech_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTechDetailResponseModel _$LabTechDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    LabTechDetailResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LabTechDetailResponseModelToJson(
        LabTechDetailResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
