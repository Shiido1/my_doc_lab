import 'package:json_annotation/json_annotation.dart';

part 'get_doctor_statistic_model.g.dart';

@JsonSerializable()
class GetDoctorStatisticModel {
  @JsonKey(name: 'total_patients')
  num? totalPatients;
  num? balance;
  @JsonKey(name: 'appointment_today')
  num? appointmentToday;
  num? unread;

  GetDoctorStatisticModel({
    this.totalPatients,
    this.balance,
    this.appointmentToday,
    this.unread,
  });

  factory GetDoctorStatisticModel.fromJson(Map<String, dynamic> json) {
    return _$GetDoctorStatisticModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDoctorStatisticModelToJson(this);
}
