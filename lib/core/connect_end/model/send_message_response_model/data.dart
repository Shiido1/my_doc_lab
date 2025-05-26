import 'package:json_annotation/json_annotation.dart';

import 'sender.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'conversation_id')
  num? conversationId;
  @JsonKey(name: 'sender_id')
  String? senderId;
  @JsonKey(name: 'sender_type')
  String? senderType;
  String? message;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  num? id;
  Sender? sender;

  Data({
    this.conversationId,
    this.senderId,
    this.senderType,
    this.message,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.sender,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
