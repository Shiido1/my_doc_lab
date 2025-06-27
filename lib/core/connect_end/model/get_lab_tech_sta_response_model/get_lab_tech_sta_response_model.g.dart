// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lab_tech_sta_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLabTechStaResponseModel _$GetLabTechStaResponseModelFromJson(
  Map<String, dynamic> json,
) => GetLabTechStaResponseModel(
  appointment: json['appointment'] as num?,
  patients: json['patients'] as num?,
  totalDiagnosis: json['total_diagnosis'] as num?,
);

Map<String, dynamic> _$GetLabTechStaResponseModelToJson(
  GetLabTechStaResponseModel instance,
) => <String, dynamic>{
  'appointment': instance.appointment,
  'patients': instance.patients,
  'total_diagnosis': instance.totalDiagnosis,
};
