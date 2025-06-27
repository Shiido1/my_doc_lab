// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Call _$CallFromJson(Map<String, dynamic> json) => Call(
  id: json['id'] as num?,
  conversationId: json['conversation_id'] as num?,
  callerId: json['caller_id'] as num?,
  callerType: json['caller_type'] as String?,
  receiverId: json['receiver_id'] as num?,
  receiverType: json['receiver_type'] as String?,
  channelName: json['channel_name'] as String?,
  status: json['status'] as String?,
  startedAt:
      json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
  endedAt: json['ended_at'],
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
  'id': instance.id,
  'conversation_id': instance.conversationId,
  'caller_id': instance.callerId,
  'caller_type': instance.callerType,
  'receiver_id': instance.receiverId,
  'receiver_type': instance.receiverType,
  'channel_name': instance.channelName,
  'status': instance.status,
  'started_at': instance.startedAt?.toIso8601String(),
  'ended_at': instance.endedAt,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
