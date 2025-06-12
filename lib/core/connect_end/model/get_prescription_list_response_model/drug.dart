import 'package:json_annotation/json_annotation.dart';

import 'medicine.dart';

part 'drug.g.dart';

@JsonSerializable()
class Drug {
  num? id;
  @JsonKey(name: 'prescription_id')
  num? prescriptionId;
  @JsonKey(name: 'medicine_id')
  String? medicineId;
  dynamic other;
  String? dosage;
  String? instructions;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  Medicine? medicine;

  Drug({
    this.id,
    this.prescriptionId,
    this.medicineId,
    this.other,
    this.dosage,
    this.instructions,
    this.createdAt,
    this.updatedAt,
    this.medicine,
  });

  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);

  Map<String, dynamic> toJson() => _$DrugToJson(this);
}
