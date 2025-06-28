// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_diagnosis_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDiagnosisListResponseModel _$GetAllDiagnosisListResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllDiagnosisListResponseModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      details: json['details'] as String?,
      userId: json['user_id'] as num?,
      diagnosisCategoryId: json['diagnosis_category_id'] as num?,
      turnaround: json['turnaround'] as String?,
      price: json['price'] as num?,
      groupType: json['group_type'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$GetAllDiagnosisListResponseModelToJson(
        GetAllDiagnosisListResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'user_id': instance.userId,
      'diagnosis_category_id': instance.diagnosisCategoryId,
      'turnaround': instance.turnaround,
      'price': instance.price,
      'group_type': instance.groupType,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
