class UpdateStatusReasonEntityModel {
  String? reason;
  String? status;

  UpdateStatusReasonEntityModel({this.reason, this.status});

  factory UpdateStatusReasonEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateStatusReasonEntityModel(
      reason: json['reason']?.toString(),
      status: json['status']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (reason != null) 'reason': reason,
    if (status != null) 'status': status,
  };
}
