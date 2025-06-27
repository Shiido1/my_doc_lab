class UpdateLabTechEntityModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? certifications;
  String? businessName;
  String? experience;
  String? profileImage;
  String? about;
  String? address;
  String? city;
  String? state;

  UpdateLabTechEntityModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.certifications,
    this.businessName,
    this.experience,
    this.profileImage,
    this.about,
    this.state,
    this.address,
    this.city,
  });

  factory UpdateLabTechEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateLabTechEntityModel(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      phoneNumber: json['phoneNumber']?.toString(),
      email: json['email']?.toString(),
      certifications: json['certifications']?.toString(),
      businessName: json['business_name']?.toString(),
      experience: json['experience']?.toString(),
      profileImage: json['profile_image']?.toString(),
      about: json['about']?.toString(),
      city: json['city']?.toString(),
      address: json['address']?.toString(),
      state: json['state']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (firstName != null) 'firstName': firstName,
    if (lastName != null) 'lastName': lastName,
    if (phoneNumber != null) 'phoneNumber': phoneNumber,
    if (email != null) 'email': email,
    if (certifications != null) 'certifications': certifications,
    if (businessName != null) 'business_name': businessName,
    if (experience != null) 'experience': experience,
    if (profileImage != null) 'profile_image': profileImage,
    if (about != null) 'about': about,
    if (city != null) 'city': city,
    if (state != null) 'state': state,
    if (address != null) 'address': address,
  };
}
