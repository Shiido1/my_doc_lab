import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History {
  num? id;
  @JsonKey(name: 'wallet_id')
  num? walletId;
  String? amount;
  String? type;
  String? status;
  String? reference;
  String? description;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  History({
    this.id,
    this.walletId,
    this.amount,
    this.type,
    this.status,
    this.reference,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return _$HistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
