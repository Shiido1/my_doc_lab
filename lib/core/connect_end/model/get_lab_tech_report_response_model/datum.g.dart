// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
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
  doctor:
      json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
  diagnosis:
      json['diagnosis'] == null
          ? null
          : Diagnosis.fromJson(json['diagnosis'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
  'doctor': instance.doctor,
  'diagnosis': instance.diagnosis,
};
