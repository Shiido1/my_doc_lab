// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  conversationId: json['conversation_id'] as num?,
  senderId: json['sender_id'],
  senderType: json['sender_type'] as String?,
  message: json['message'] as String?,
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  id: json['id'] as num?,
  sender:
      json['sender'] == null
          ? null
          : Sender.fromJson(json['sender'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'conversation_id': instance.conversationId,
  'sender_id': instance.senderId,
  'sender_type': instance.senderType,
  'message': instance.message,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'id': instance.id,
  'sender': instance.sender,
};
