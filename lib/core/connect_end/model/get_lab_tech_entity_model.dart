class GetLabTechEntityModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? certifications;
  String? experience;
  String? profileImage;
  String? about;

  GetLabTechEntityModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.certifications,
    this.experience,
    this.profileImage,
    this.about,
  });

  factory GetLabTechEntityModel.fromJson(Map<String, dynamic> json) {
    return GetLabTechEntityModel(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      phoneNumber: json['phoneNumber']?.toString(),
      email: json['email']?.toString(),
      certifications: json['certifications']?.toString(),
      experience: json['experience']?.toString(),
      profileImage: json['profile_image']?.toString(),
      about: json['about']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (firstName != null) 'firstName': firstName,
    if (lastName != null) 'lastName': lastName,
    if (phoneNumber != null) 'phoneNumber': phoneNumber,
    if (email != null) 'email': email,
    if (certifications != null) 'certifications': certifications,
    if (experience != null) 'experience': experience,
    if (profileImage != null) 'profile_image': profileImage,
    if (about != null) 'about': about,
  };
}
