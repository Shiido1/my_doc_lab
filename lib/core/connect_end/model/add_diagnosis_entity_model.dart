class AddDiagnosisEntityModel {
  String? name;
  String? turnaround;
  String? details;
  String? groupType;
  num? diagnosisCategoryId;
  num? price;
  String? status;

  AddDiagnosisEntityModel({
    this.name,
    this.turnaround,
    this.details,
    this.groupType,
    this.diagnosisCategoryId,
    this.price,
    this.status,
  });

  factory AddDiagnosisEntityModel.fromJson(Map<String, dynamic> json) {
    return AddDiagnosisEntityModel(
      name: json['name']?.toString(),
      turnaround: json['turnaround']?.toString(),
      details: json['details']?.toString(),
      groupType: json['group_type']?.toString(),
      diagnosisCategoryId: num.tryParse(
        json['diagnosis_category_id'].toString(),
      ),
      price: num.tryParse(json['price'].toString()),
      status: json['status']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (name != null) 'name': name,
    if (turnaround != null) 'turnaround': turnaround,
    if (details != null) 'details': details,
    if (groupType != null) 'group_type': groupType,
    if (diagnosisCategoryId != null)
      'diagnosis_category_id': diagnosisCategoryId,
    if (price != null) 'price': price,
    if (status != null) 'status': status,
  };
}
