// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_prescription_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPrescriptionListResponseModel _$GetPrescriptionListResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetPrescriptionListResponseModel(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      doctorId: json['doctor_id'] as num?,
      notes: json['notes'] as String?,
      file: json['file'],
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      drugs: (json['drugs'] as List<dynamic>?)
          ?.map((e) => Drug.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPrescriptionListResponseModelToJson(
        GetPrescriptionListResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'doctor_id': instance.doctorId,
      'notes': instance.notes,
      'file': instance.file,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'drugs': instance.drugs,
      'user': instance.user,
      'doctor': instance.doctor,
    };
