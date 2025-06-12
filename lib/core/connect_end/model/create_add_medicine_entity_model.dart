class CreateAddMedicineEntityModel {
  num? medicineId;
  String? dosage;
  String? other;
  String? frequency;
  String? instructions;

  CreateAddMedicineEntityModel({
    this.medicineId,
    this.dosage,
    this.other,
    this.frequency,
    this.instructions,
  });

  factory CreateAddMedicineEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateAddMedicineEntityModel(
      medicineId: num.tryParse(json['medicine_id'].toString()),
      dosage: json['dosage']?.toString(),
      other: json['other']?.toString(),
      frequency: json['frequency']?.toString(),
      instructions: json['instructions']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (medicineId != null) 'medicine_id': medicineId,
    if (dosage != null) 'dosage': dosage,
    if (other != null) 'other': other,
    if (frequency != null) 'frequency': frequency,
    if (instructions != null) 'instructions': instructions,
  };
}
