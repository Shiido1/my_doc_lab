import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
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

  Datum({
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
