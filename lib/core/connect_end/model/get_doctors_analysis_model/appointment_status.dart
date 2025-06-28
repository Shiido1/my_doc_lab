import 'package:json_annotation/json_annotation.dart';

part 'appointment_status.g.dart';

@JsonSerializable()
class AppointmentStatus {
  @JsonKey(name: 'Rescheduled')
  num? rescheduled;
  @JsonKey(name: 'Scheduled')
  num? scheduled;
  @JsonKey(name: 'Cancelled')
  num? cancelled;
  @JsonKey(name: 'Completed')
  num? completed;

  AppointmentStatus({
    this.rescheduled,
    this.scheduled,
    this.cancelled,
    this.completed,
  });

  factory AppointmentStatus.fromJson(Map<String, dynamic> json) {
    return _$AppointmentStatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppointmentStatusToJson(this);
}
