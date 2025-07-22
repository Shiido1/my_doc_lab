// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
  doctor: json['doctor'] as String?,
  diagnosis: json['diagnosis'] as String?,
  summary: json['summary'] as String?,
  status: json['status'] as String?,
  imageUrl: json['imageUrl'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
  'doctor': instance.doctor,
  'diagnosis': instance.diagnosis,
  'summary': instance.summary,
  'status': instance.status,
  'imageUrl': instance.imageUrl,
  'date': instance.date?.toIso8601String(),
};
