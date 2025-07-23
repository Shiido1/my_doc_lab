class CareGiverResiterEntityModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? speciality;
  String? confirmPassword;
  String? city;
  String? state;
  String? address;
  String? role;
  String? specializationId;

  CareGiverResiterEntityModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
    this.speciality,
    this.confirmPassword,
    this.city,
    this.state,
    this.address,
    this.role,
    this.specializationId,
  });

  factory CareGiverResiterEntityModel.fromJson(Map<String, dynamic> json) {
    return CareGiverResiterEntityModel(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      phoneNumber: json['phoneNumber']?.toString(),
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      speciality: json['speciality']?.toString(),
      confirmPassword: json['confirmPassword']?.toString(),
      city: json['city']?.toString(),
      state: json['state']?.toString(),
      address: json['address']?.toString(),
      role: json['role']?.toString(),
      specializationId: json['specialization_id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (firstName != null) 'firstName': firstName,
    if (lastName != null) 'lastName': lastName,
    if (phoneNumber != null) 'phoneNumber': phoneNumber,
    if (email != null) 'email': email,
    if (password != null) 'password': password,
    if (speciality != null) 'speciality': speciality,
    if (confirmPassword != null) 'confirmPassword': confirmPassword,
    if (city != null) 'city': city,
    if (state != null) 'state': state,
    if (address != null) 'address': address,
    if (role != null) 'role': role,
    if (specializationId != null) 'specialization_id': specializationId,
  };
}
