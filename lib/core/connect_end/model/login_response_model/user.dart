import 'package:json_annotation/json_annotation.dart';

import 'transaction.dart';
import 'wallet.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  String? status;
  String? kycStatus;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<Wallet>? wallets;
  List<Transaction>? transactions;

  User({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.status,
    this.kycStatus,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.wallets,
    this.transactions,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
