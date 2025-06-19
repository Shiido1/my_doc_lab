// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
  id: json['id'] as num?,
  prescriptionId: json['prescription_id'] as num?,
  medicineId: json['medicine_id'] as String?,
  other: json['other'],
  dosage: json['dosage'] as String?,
  frequency: json['frequency'],
  instructions: json['instructions'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  medicine:
      json['medicine'] == null
          ? null
          : Medicine.fromJson(json['medicine'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
  'id': instance.id,
  'prescription_id': instance.prescriptionId,
  'medicine_id': instance.medicineId,
  'other': instance.other,
  'dosage': instance.dosage,
  'frequency': instance.frequency,
  'instructions': instance.instructions,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'medicine': instance.medicine,
};
