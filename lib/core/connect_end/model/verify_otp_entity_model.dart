class VerifyOtpEntityModel {
  String? email;
  String? otp;

  VerifyOtpEntityModel({this.email, this.otp});

  factory VerifyOtpEntityModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpEntityModel(
      email: json['email']?.toString(),
      otp: json['otp']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (email != null) 'email': email,
    if (otp != null) 'otp': otp,
  };
}
