class GetAllDoctorsResponseModelList {
  final List<GetAllDoctorsResponseModel>? getAllDoctorsResponseModelList;

  GetAllDoctorsResponseModelList({this.getAllDoctorsResponseModelList});

  factory GetAllDoctorsResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<GetAllDoctorsResponseModel> getAllDoctorsResponseModel =
        parsedJson.map((i) => GetAllDoctorsResponseModel.fromJson(i)).toList();

    return GetAllDoctorsResponseModelList(
      getAllDoctorsResponseModelList: getAllDoctorsResponseModel,
    );
  }
}

class GetAllDoctorsResponseModel {
  int? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  String? about;
  String? speciality;
  String? status;
  String? emailVerifiedAt;
  String? certifications;
  String? experience;
  String? profileImage;
  String? city;
  String? state;
  String? address;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  GetAllDoctorsResponseModel({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.about,
    this.speciality,
    this.status,
    this.emailVerifiedAt,
    this.certifications,
    this.experience,
    this.profileImage,
    this.city,
    this.state,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  GetAllDoctorsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    about = json['about'];
    speciality = json['speciality'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    certifications = json['certifications'];
    experience = json['experience'];
    profileImage = json['profile_image'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['about'] = about;
    data['speciality'] = speciality;
    data['status'] = status;
    data['email_verified_at'] = emailVerifiedAt;
    data['certifications'] = certifications;
    data['experience'] = experience;
    data['profile_image'] = profileImage;
    data['city'] = city;
    data['state'] = state;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
