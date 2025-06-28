// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_consultant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllConsultantResponseModel _$GetAllConsultantResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllConsultantResponseModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      details: json['details'] as String?,
      price: json['price'] as num?,
      includeDetails: json['include_details'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$GetAllConsultantResponseModelToJson(
        GetAllConsultantResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'price': instance.price,
      'include_details': instance.includeDetails,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
