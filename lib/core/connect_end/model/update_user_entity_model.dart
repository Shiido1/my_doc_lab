class UpdateUserEntityModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? confirmPassword;
  String? city;
  String? state;
  String? address;
  String? profileImage;

  UpdateUserEntityModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
    this.confirmPassword,
    this.city,
    this.state,
    this.address,
    this.profileImage,
  });

  factory UpdateUserEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserEntityModel(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      phoneNumber: json['phone']?.toString(),
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      confirmPassword: json['confirmPassword']?.toString(),
      city: json['city']?.toString(),
      state: json['state']?.toString(),
      address: json['address']?.toString(),
      profileImage: json['profile_image']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (firstName != null) 'firstName': firstName,
    if (lastName != null) 'lastName': lastName,
    if (phoneNumber != null) 'phone': phoneNumber,
    if (email != null) 'email': email,
    if (password != null) 'password': password,
    if (confirmPassword != null) 'confirmPassword': confirmPassword,
    if (city != null) 'city': city,
    if (state != null) 'state': state,
    if (address != null) 'address': address,
    if (profileImage != null) 'profile_image': profileImage,
  };
}
