import 'package:json_annotation/json_annotation.dart';

part 'wallets.g.dart';

@JsonSerializable()
class Wallets {
  num? id;
  String? uuid;
  num? ownerId;
  String? ownerType;
  num? currencyId;
  num? balance;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Wallets({
    this.id,
    this.uuid,
    this.ownerId,
    this.ownerType,
    this.currencyId,
    this.balance,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Wallets.fromJson(Map<String, dynamic> json) {
    return _$WalletsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WalletsToJson(this);
}
