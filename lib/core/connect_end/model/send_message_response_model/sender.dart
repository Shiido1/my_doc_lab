import 'package:json_annotation/json_annotation.dart';

part 'sender.g.dart';

@JsonSerializable()
class Sender {
  String? id;
  String? uuid;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  dynamic gender;
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

  Sender({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
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
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return _$SenderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SenderToJson(this);
}
