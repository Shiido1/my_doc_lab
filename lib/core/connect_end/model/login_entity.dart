class LoginEntityModel {
  String? email;
  String? password;
  String? deviceToken;
  String? deviceType;

  LoginEntityModel({
    this.email,
    this.password,
    this.deviceToken,
    this.deviceType,
  });

  LoginEntityModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    return data;
  }
}
