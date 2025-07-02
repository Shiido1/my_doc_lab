class VerifyOtpEntityModel {
  String? email;
  String? otp;
  String? role;

  VerifyOtpEntityModel({this.email, this.otp, this.role});

  factory VerifyOtpEntityModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpEntityModel(
      email: json['email']?.toString(),
      otp: json['otp']?.toString(),
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (email != null) 'email': email,
    if (otp != null) 'otp': otp,
    if (role != null) 'role': role,
  };
}
