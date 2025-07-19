// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_tech_recent_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTechRecentAppointmentModel _$LabTechRecentAppointmentModelFromJson(
  Map<String, dynamic> json,
) => LabTechRecentAppointmentModel(
  id: json['id'] as num?,
  userId: json['user_id'] as num?,
  diagnosisId: json['diagnosis_id'] as num?,
  orderId: json['order_id'] as num?,
  labTechnicianId: json['lab_technician_id'] as num?,
  status: json['status'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  time: json['time'] as String?,
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
  diagnosis:
      json['diagnosis'] == null
          ? null
          : Diagnosis.fromJson(json['diagnosis'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LabTechRecentAppointmentModelToJson(
  LabTechRecentAppointmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'diagnosis_id': instance.diagnosisId,
  'order_id': instance.orderId,
  'lab_technician_id': instance.labTechnicianId,
  'status': instance.status,
  'date': instance.date?.toIso8601String(),
  'time': instance.time,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'user': instance.user,
  'diagnosis': instance.diagnosis,
};
