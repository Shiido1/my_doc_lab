// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersAppointmentModel _$GetUsersAppointmentModelFromJson(
  Map<String, dynamic> json,
) => GetUsersAppointmentModel(
  id: json['id'] as num?,
  userId: json['user_id'] as num?,
  doctorId: json['doctor_id'] as num?,
  serviceType: json['service_type'] as String?,
  message: json['message'] as String?,
  slotId: json['slot_id'] as num?,
  orderId: json['order_id'] as num?,
  status: json['status'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  doctor:
      json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
  slot:
      json['slot'] == null
          ? null
          : Slot.fromJson(json['slot'] as Map<String, dynamic>),
  consultation:
      json['consultation'] == null
          ? null
          : Consultation.fromJson(json['consultation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUsersAppointmentModelToJson(
  GetUsersAppointmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'doctor_id': instance.doctorId,
  'service_type': instance.serviceType,
  'message': instance.message,
  'slot_id': instance.slotId,
  'order_id': instance.orderId,
  'status': instance.status,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
  'doctor': instance.doctor,
  'slot': instance.slot,
  'consultation': instance.consultation,
};
