// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_tech_category_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTechCategoryListResponseModel _$LabTechCategoryListResponseModelFromJson(
  Map<String, dynamic> json,
) => LabTechCategoryListResponseModel(
  id: json['id'] as num?,
  name: json['name'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$LabTechCategoryListResponseModelToJson(
  LabTechCategoryListResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
