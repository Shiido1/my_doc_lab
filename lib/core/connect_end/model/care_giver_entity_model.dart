class CareGiverEntityModel {
  String? email;
  String? password;
  String? role;
  String? deviceToken;
  String? deviceType;

  CareGiverEntityModel({
    this.email,
    this.password,
    this.role,
    this.deviceToken,
    this.deviceType,
  });

  factory CareGiverEntityModel.fromJson(Map<String, dynamic> json) {
    return CareGiverEntityModel(
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      role: json['role']?.toString(),
      deviceToken: json['device_token']?.toString(),
      deviceType: json['device_type']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (email != null) 'email': email,
    if (password != null) 'password': password,
    if (role != null) 'role': role,
    if (deviceToken != null) 'device_token': deviceToken,
    if (deviceType != null) 'device_type': deviceType,
  };
}
