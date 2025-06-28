// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentStatus _$AppointmentStatusFromJson(Map<String, dynamic> json) =>
    AppointmentStatus(
      rescheduled: json['Rescheduled'] as num?,
      scheduled: json['Scheduled'] as num?,
      cancelled: json['Cancelled'] as num?,
      completed: json['Completed'] as num?,
    );

Map<String, dynamic> _$AppointmentStatusToJson(AppointmentStatus instance) =>
    <String, dynamic>{
      'Rescheduled': instance.rescheduled,
      'Scheduled': instance.scheduled,
      'Cancelled': instance.cancelled,
      'Completed': instance.completed,
    };
