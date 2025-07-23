// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorsAnalysisModel _$GetDoctorsAnalysisModelFromJson(
        Map<String, dynamic> json) =>
    GetDoctorsAnalysisModel(
      totalPatients: json['total_patients'] as num?,
      patientsMonth: json['patients_month'] as num?,
      appointment: json['appointment'] as num?,
      duration: json['duration'] as num?,
      appointmentStatus: json['appointment_status'] == null
          ? null
          : AppointmentStatus.fromJson(
              json['appointment_status'] as Map<String, dynamic>),
      patientsVist: (json['patients_vist'] as List<dynamic>?)
          ?.map((e) => PatientsVist.fromJson(e as Map<String, dynamic>))
          .toList(),
      ageDistribution: json['age_distribution'] == null
          ? null
          : AgeDistribution.fromJson(
              json['age_distribution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDoctorsAnalysisModelToJson(
        GetDoctorsAnalysisModel instance) =>
    <String, dynamic>{
      'total_patients': instance.totalPatients,
      'patients_month': instance.patientsMonth,
      'appointment': instance.appointment,
      'duration': instance.duration,
      'appointment_status': instance.appointmentStatus,
      'patients_vist': instance.patientsVist,
      'age_distribution': instance.ageDistribution,
    };
