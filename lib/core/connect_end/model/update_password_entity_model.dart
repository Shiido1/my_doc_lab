class UpdatePasswordEntityModel {
  String? oldPassword;
  String? newPassword;

  UpdatePasswordEntityModel({this.oldPassword, this.newPassword});

  factory UpdatePasswordEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordEntityModel(
      oldPassword: json['old_password']?.toString(),
      newPassword: json['new_password']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (oldPassword != null) 'old_password': oldPassword,
    if (newPassword != null) 'new_password': newPassword,
  };
}
