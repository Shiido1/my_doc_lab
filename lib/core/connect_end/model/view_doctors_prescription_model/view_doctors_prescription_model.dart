import 'package:json_annotation/json_annotation.dart';

import 'doctor.dart';
import 'drug.dart';
import 'user.dart';

part 'view_doctors_prescription_model.g.dart';

@JsonSerializable()
class ViewDoctorsPrescriptionModel {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'doctor_id')
  num? doctorId;
  String? notes;
  dynamic file;
  String? status;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  List<Drug>? drugs;
  User? user;
  Doctor? doctor;

  ViewDoctorsPrescriptionModel({
    this.id,
    this.userId,
    this.doctorId,
    this.notes,
    this.file,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.drugs,
    this.user,
    this.doctor,
  });

  factory ViewDoctorsPrescriptionModel.fromJson(Map<String, dynamic> json) {
    return _$ViewDoctorsPrescriptionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ViewDoctorsPrescriptionModelToJson(this);
}
