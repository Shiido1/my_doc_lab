import 'package:json_annotation/json_annotation.dart';

import 'diagnosis.dart';
import 'user.dart';

part 'lab_tech_recent_appointment_model.g.dart';

class LabTechRecentAppointmentModelList {
  final List<LabTechRecentAppointmentModel>? labTechRecentAppointmentModelList;

  LabTechRecentAppointmentModelList({this.labTechRecentAppointmentModelList});

  factory LabTechRecentAppointmentModelList.fromJson(List<dynamic> parsedJson) {
    List<LabTechRecentAppointmentModel> labTechRecentAppointmentModel =
        parsedJson
            .map((i) => LabTechRecentAppointmentModel.fromJson(i))
            .toList();

    return LabTechRecentAppointmentModelList(
      labTechRecentAppointmentModelList: labTechRecentAppointmentModel,
    );
  }
}

@JsonSerializable()
class LabTechRecentAppointmentModel {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'diagnosis_id')
  num? diagnosisId;
  @JsonKey(name: 'order_id')
  num? orderId;
  @JsonKey(name: 'lab_technician_id')
  num? labTechnicianId;
  String? status;
  DateTime? date;
  String? time;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  User? user;
  Diagnosis? diagnosis;

  LabTechRecentAppointmentModel({
    this.id,
    this.userId,
    this.diagnosisId,
    this.orderId,
    this.labTechnicianId,
    this.status,
    this.date,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.diagnosis,
  });

  factory LabTechRecentAppointmentModel.fromJson(Map<String, dynamic> json) {
    return _$LabTechRecentAppointmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LabTechRecentAppointmentModelToJson(this);
}
