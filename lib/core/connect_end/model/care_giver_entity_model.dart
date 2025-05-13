class CareGiverEntityModel {
  String? email;
  String? password;
  String? role;

  CareGiverEntityModel({this.email, this.password, this.role});

  factory CareGiverEntityModel.fromJson(Map<String, dynamic> json) {
    return CareGiverEntityModel(
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (email != null) 'email': email,
    if (password != null) 'password': password,
    if (role != null) 'role': role,
  };
}
