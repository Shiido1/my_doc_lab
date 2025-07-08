class ForgotPasswordEntityModel {
  String? email;
  String? role;

  ForgotPasswordEntityModel({this.email, this.role});

  factory ForgotPasswordEntityModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordEntityModel(
      email: json['email']?.toString(),
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (email != null) 'email': email,
    if (role != null) 'role': role,
  };
}
