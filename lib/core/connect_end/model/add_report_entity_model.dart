class AddReportEntityModel {
  num? userId;
  num? diagnosisId;
  num? doctorId;
  String? status;
  String? imageUrl;
  String? summary;

  AddReportEntityModel({
    this.userId,
    this.diagnosisId,
    this.doctorId,
    this.status,
    this.imageUrl,
    this.summary,
  });

  factory AddReportEntityModel.fromJson(Map<String, dynamic> json) {
    return AddReportEntityModel(
      userId: num.tryParse(json['user_id'].toString()),
      diagnosisId: num.tryParse(json['diagnosis_id'].toString()),
      doctorId: num.tryParse(json['doctor_id'].toString()),
      status: json['status']?.toString(),
      imageUrl: json['image_url']?.toString(),
      summary: json['summary']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (userId != null) 'user_id': userId,
    if (diagnosisId != null) 'diagnosis_id': diagnosisId,
    if (doctorId != null) 'doctor_id': doctorId,
    if (status != null) 'status': status,
    if (imageUrl != null) 'image_url': imageUrl,
    if (summary != null) 'summary': summary,
  };
}
