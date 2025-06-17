import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'profile_image')
  String? profileImage;
  @JsonKey(name: 'account_id')
  String? accountId;
  String? classtype;
  dynamic age;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.profileImage,
    this.accountId,
    this.classtype,
    this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
