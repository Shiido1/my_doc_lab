import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  String? speciality;
  String? phone;
  String? address;
  String? city;
  String? state;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  User({
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.speciality,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
