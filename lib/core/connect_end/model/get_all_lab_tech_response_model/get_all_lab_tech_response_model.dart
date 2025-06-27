import 'package:json_annotation/json_annotation.dart';

part 'get_all_lab_tech_response_model.g.dart';

class GetAllLabTechResponseModelList {
  final List<GetAllLabTechResponseModel>? getAllLabTechResponseModelList;

  GetAllLabTechResponseModelList({this.getAllLabTechResponseModelList});

  factory GetAllLabTechResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<GetAllLabTechResponseModel> getAllLabTechResponseModel =
        parsedJson.map((i) => GetAllLabTechResponseModel.fromJson(i)).toList();

    return GetAllLabTechResponseModelList(
      getAllLabTechResponseModelList: getAllLabTechResponseModel,
    );
  }
}

@JsonSerializable()
class GetAllLabTechResponseModel {
  num? id;
  String? uuid;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  @JsonKey(name: 'business_name')
  dynamic businessName;
  String? about;
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

  GetAllLabTechResponseModel({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.businessName,
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

  factory GetAllLabTechResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllLabTechResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllLabTechResponseModelToJson(this);
}
