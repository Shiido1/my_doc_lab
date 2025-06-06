import 'package:json_annotation/json_annotation.dart';

import 'wallets.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? uuid;
  String? firstName;
  String? lastName;
  dynamic gender;
  String? email;
  String? phone;
  String? status;
  DateTime? emailVerifiedAt;
  String? accountId;
  String? city;
  String? state;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? token;
  String? userType;
  String? classtype;
  Wallets? wallets;
  List<dynamic>? transactions;

  Data({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.status,
    this.emailVerifiedAt,
    this.accountId,
    this.city,
    this.state,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
    this.userType,
    this.classtype,
    this.wallets,
    this.transactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
