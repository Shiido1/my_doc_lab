class ForgotPasswordEntityModel {
  String? email;

  ForgotPasswordEntityModel({this.email});

  factory ForgotPasswordEntityModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordEntityModel(email: json['email']?.toString());
  }

  Map<String, dynamic> toJson() => {if (email != null) 'email': email};
}
