class ResetPasswordEntityModel {
  String? token;
  String? userId;
  String? password;
  String? passwordConfirmation;

  ResetPasswordEntityModel({
    this.token,
    this.userId,
    this.password,
    this.passwordConfirmation,
  });

  factory ResetPasswordEntityModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordEntityModel(
      token: json['token']?.toString(),
      userId: json['user_id']?.toString(),
      password: json['password']?.toString(),
      passwordConfirmation: json['password_confirmation']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (token != null) 'token': token,
    if (userId != null) 'user_id': userId,
    if (password != null) 'password': password,
    if (passwordConfirmation != null)
      'password_confirmation': passwordConfirmation,
  };
}
