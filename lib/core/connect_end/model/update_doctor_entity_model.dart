class UpdateDoctorEntityModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? speciality;
  String? certifications;
  String? experience;
  String? profileImage;
  String? about;

  UpdateDoctorEntityModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.speciality,
    this.certifications,
    this.experience,
    this.profileImage,
    this.about,
  });

  factory UpdateDoctorEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateDoctorEntityModel(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      phoneNumber: json['phone']?.toString(),
      email: json['email']?.toString(),
      speciality: json['speciality']?.toString(),
      certifications: json['certifications']?.toString(),
      experience: json['experience']?.toString(),
      profileImage: json['profile_image']?.toString(),
      about: json['about']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (firstName != null) 'firstName': firstName,
    if (lastName != null) 'lastName': lastName,
    if (phoneNumber != null) 'phone': phoneNumber,
    if (email != null) 'email': email,
    if (speciality != null) 'speciality': speciality,
    if (certifications != null) 'certifications': certifications,
    if (experience != null) 'experience': experience,
    if (profileImage != null) 'profile_image': profileImage,
    if (about != null) 'about': about,
  };
}
