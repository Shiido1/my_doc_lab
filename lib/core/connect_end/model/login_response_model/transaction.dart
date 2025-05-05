import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  String? uuid;
  num? userId;
  String? referenceNumber;
  String? channel;
  String? type;
  dynamic amount;
  String? status;
  DateTime? createdAt;

  Transaction({
    this.uuid,
    this.userId,
    this.referenceNumber,
    this.channel,
    this.type,
    this.amount,
    this.status,
    this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return _$TransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
