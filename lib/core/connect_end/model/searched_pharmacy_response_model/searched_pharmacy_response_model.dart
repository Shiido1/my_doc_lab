import 'package:json_annotation/json_annotation.dart';

part 'searched_pharmacy_response_model.g.dart';

@JsonSerializable()
class SearchedPharmacyResponseModel {
  num? id;
  String? uuid;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  dynamic about;
  String? status;
  @JsonKey(name: 'email_verified_at')
  DateTime? emailVerifiedAt;
  dynamic certifications;
  dynamic experience;
  @JsonKey(name: 'profile_image')
  dynamic profileImage;
  String? city;
  String? state;
  String? address;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  SearchedPharmacyResponseModel({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.about,
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

  factory SearchedPharmacyResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SearchedPharmacyResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchedPharmacyResponseModelToJson(this);
}
