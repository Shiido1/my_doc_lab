import 'package:json_annotation/json_annotation.dart';

part 'call.g.dart';

@JsonSerializable()
class Call {
  num? id;
  @JsonKey(name: 'conversation_id')
  num? conversationId;
  @JsonKey(name: 'caller_id')
  num? callerId;
  @JsonKey(name: 'caller_type')
  String? callerType;
  @JsonKey(name: 'receiver_id')
  num? receiverId;
  @JsonKey(name: 'receiver_type')
  String? receiverType;
  @JsonKey(name: 'channel_name')
  String? channelName;
  String? status;
  @JsonKey(name: 'started_at')
  DateTime? startedAt;
  @JsonKey(name: 'ended_at')
  dynamic endedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Call({
    this.id,
    this.conversationId,
    this.callerId,
    this.callerType,
    this.receiverId,
    this.receiverType,
    this.channelName,
    this.status,
    this.startedAt,
    this.endedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

  Map<String, dynamic> toJson() => _$CallToJson(this);
}
