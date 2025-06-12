import 'package:json_annotation/json_annotation.dart';

import 'doctor.dart';
import 'drug.dart';
import 'user.dart';

part 'prescription_view_response.g.dart';

@JsonSerializable()
class PrescriptionViewResponse {
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

  PrescriptionViewResponse({
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

  factory PrescriptionViewResponse.fromJson(Map<String, dynamic> json) {
    return _$PrescriptionViewResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrescriptionViewResponseToJson(this);
}
