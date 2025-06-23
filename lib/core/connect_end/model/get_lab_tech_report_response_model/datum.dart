import 'package:json_annotation/json_annotation.dart';

import 'diagnosis.dart';
import 'doctor.dart';
import 'user.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'diagnosis_id')
  num? diagnosisId;
  @JsonKey(name: 'doctor_id')
  num? doctorId;
  @JsonKey(name: 'booking_id')
  num? bookingId;
  @JsonKey(name: 'lab_technician_id')
  num? labTechnicianId;
  String? status;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  String? summary;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  User? user;
  Doctor? doctor;
  Diagnosis? diagnosis;

  Datum({
    this.id,
    this.userId,
    this.diagnosisId,
    this.doctorId,
    this.bookingId,
    this.labTechnicianId,
    this.status,
    this.imageUrl,
    this.summary,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.doctor,
    this.diagnosis,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
