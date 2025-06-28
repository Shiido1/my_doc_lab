import 'package:json_annotation/json_annotation.dart';

import 'age_distribution.dart';
import 'appointment_status.dart';
import 'patients_vist.dart';

part 'get_doctors_analysis_model.g.dart';

@JsonSerializable()
class GetDoctorsAnalysisModel {
  @JsonKey(name: 'total_patients')
  num? totalPatients;
  @JsonKey(name: 'patients_month')
  num? patientsMonth;
  num? appointment;
  num? duration;
  @JsonKey(name: 'appointment_status')
  AppointmentStatus? appointmentStatus;
  @JsonKey(name: 'patients_vist')
  List<PatientsVist>? patientsVist;
  @JsonKey(name: 'age_distribution')
  AgeDistribution? ageDistribution;

  GetDoctorsAnalysisModel({
    this.totalPatients,
    this.patientsMonth,
    this.appointment,
    this.duration,
    this.appointmentStatus,
    this.patientsVist,
    this.ageDistribution,
  });

  factory GetDoctorsAnalysisModel.fromJson(Map<String, dynamic> json) {
    return _$GetDoctorsAnalysisModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDoctorsAnalysisModelToJson(this);
}
