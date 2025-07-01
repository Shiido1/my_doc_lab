// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_report_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportResponseModel _$GetReportResponseModelFromJson(
  Map<String, dynamic> json,
) => GetReportResponseModel(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetReportResponseModelToJson(
  GetReportResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
