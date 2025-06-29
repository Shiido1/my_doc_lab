class CreatePrescriptionEntityModel {
  String? userId;
  String? notes;

  CreatePrescriptionEntityModel({this.userId, this.notes});

  factory CreatePrescriptionEntityModel.fromJson(Map<String, dynamic> json) {
    return CreatePrescriptionEntityModel(
      userId: json['account_id'].toString(),
      notes: json['notes']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (userId != null) 'account_id': userId,
    if (notes != null) 'notes': notes,
  };
}
