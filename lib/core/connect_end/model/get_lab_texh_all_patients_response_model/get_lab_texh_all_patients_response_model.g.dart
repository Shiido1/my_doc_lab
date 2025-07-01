// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lab_texh_all_patients_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLabTexhAllPatientsResponseModel _$GetLabTexhAllPatientsResponseModelFromJson(
  Map<String, dynamic> json,
) => GetLabTexhAllPatientsResponseModel(
  id: json['id'] as num?,
  userId: json['user_id'] as num?,
  diagnosisId: json['diagnosis_id'] as num?,
  doctorId: json['doctor_id'] as num?,
  bookingId: json['booking_id'] as num?,
  labTechnicianId: json['lab_technician_id'] as num?,
  status: json['status'] as String?,
  imageUrl: json['image_url'] as String?,
  summary: json['summary'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetLabTexhAllPatientsResponseModelToJson(
  GetLabTexhAllPatientsResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'diagnosis_id': instance.diagnosisId,
  'doctor_id': instance.doctorId,
  'booking_id': instance.bookingId,
  'lab_technician_id': instance.labTechnicianId,
  'status': instance.status,
  'image_url': instance.imageUrl,
  'summary': instance.summary,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'user': instance.user,
};
