import 'package:json_annotation/json_annotation.dart';

part 'user_search_response_model.g.dart';

class UserSearchResponseModelList {
  final List<UserSearchResponseModel>? userSearchResponseModelList;

  UserSearchResponseModelList({this.userSearchResponseModelList});

  factory UserSearchResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<UserSearchResponseModel> userSearchResponseModel =
        parsedJson.map((i) => UserSearchResponseModel.fromJson(i)).toList();

    return UserSearchResponseModelList(
      userSearchResponseModelList: userSearchResponseModel,
    );
  }
}

@JsonSerializable()
class UserSearchResponseModel {
  String? id;
  String? uuid;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? gender;
  String? dob;
  String? email;
  String? phone;
  @JsonKey(name: 'profile_image')
  String? profileImage;
  String? status;
  @JsonKey(name: 'email_verified_at')
  DateTime? emailVerifiedAt;
  @JsonKey(name: 'account_id')
  String? accountId;
  String? city;
  String? state;
  String? address;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  String? classtype;
  num? age;

  UserSearchResponseModel({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.email,
    this.phone,
    this.profileImage,
    this.status,
    this.emailVerifiedAt,
    this.accountId,
    this.city,
    this.state,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.classtype,
    this.age,
  });

  factory UserSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserSearchResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserSearchResponseModelToJson(this);
}
