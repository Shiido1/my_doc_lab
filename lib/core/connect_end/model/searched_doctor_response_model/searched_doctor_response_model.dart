import 'package:json_annotation/json_annotation.dart';

part 'searched_doctor_response_model.g.dart';

@JsonSerializable()
class SearchedDoctorResponseModel {
  num? id;
  String? uuid;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  String? about;
  String? speciality;
  String? status;
  @JsonKey(name: 'email_verified_at')
  DateTime? emailVerifiedAt;
  String? certifications;
  String? experience;
  @JsonKey(name: 'profile_image')
  String? profileImage;
  String? city;
  String? state;
  String? address;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  SearchedDoctorResponseModel({
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

  factory SearchedDoctorResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SearchedDoctorResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchedDoctorResponseModelToJson(this);
}
