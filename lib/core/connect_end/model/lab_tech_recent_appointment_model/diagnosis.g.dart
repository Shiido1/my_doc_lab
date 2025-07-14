// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diagnosis _$DiagnosisFromJson(Map<String, dynamic> json) => Diagnosis(
      id: json['id'] as num?,
      name: json['name'] as String?,
      categoryName: json['category_name'],
      category: json['category'],
    );

Map<String, dynamic> _$DiagnosisToJson(Diagnosis instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_name': instance.categoryName,
      'category': instance.category,
    };
