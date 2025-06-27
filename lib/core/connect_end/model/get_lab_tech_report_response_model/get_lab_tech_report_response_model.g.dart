// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lab_tech_report_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLabTechReportResponseModel _$GetLabTechReportResponseModelFromJson(
  Map<String, dynamic> json,
) => GetLabTechReportResponseModel(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetLabTechReportResponseModelToJson(
  GetLabTechReportResponseModel instance,
) => <String, dynamic>{'data': instance.data};
