class RequestOtpEntityModel {
  String? email;
  String? role;

  RequestOtpEntityModel({this.email, this.role});

  factory RequestOtpEntityModel.fromJson(Map<String, dynamic> json) {
    return RequestOtpEntityModel(
      email: json['email']?.toString(),
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (email != null) 'email': email,
    if (role != null) 'role': role,
  };
}
