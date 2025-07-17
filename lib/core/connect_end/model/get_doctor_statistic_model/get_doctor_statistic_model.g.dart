// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorStatisticModel _$GetDoctorStatisticModelFromJson(
        Map<String, dynamic> json) =>
    GetDoctorStatisticModel(
      totalPatients: json['total_patients'] as num?,
      balance: json['balance'] as num?,
      appointmentToday: json['appointment_today'] as num?,
      unread: json['unread'] as num?,
    );

Map<String, dynamic> _$GetDoctorStatisticModelToJson(
        GetDoctorStatisticModel instance) =>
    <String, dynamic>{
      'total_patients': instance.totalPatients,
      'balance': instance.balance,
      'appointment_today': instance.appointmentToday,
      'unread': instance.unread,
    };
