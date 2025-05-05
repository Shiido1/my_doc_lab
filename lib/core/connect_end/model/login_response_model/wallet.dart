import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  num? id;
  String? uuid;
  num? userId;
  num? currencyId;
  num? balance;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Wallet({
    this.id,
    this.uuid,
    this.userId,
    this.currencyId,
    this.balance,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return _$WalletFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
