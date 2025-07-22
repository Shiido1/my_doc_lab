// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedMessageResponseModel _$ReceivedMessageResponseModelFromJson(
  Map<String, dynamic> json,
) => ReceivedMessageResponseModel(
  id: json['id'] as num?,
  conversationId: json['conversation_id'] as num?,
  senderId: json['sender_id'] as num?,
  senderType: json['sender_type'] as String?,
  message: json['message'] as String?,
  readAt: json['read_at'],
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  sender:
      json['sender'] == null
          ? null
          : Sender.fromJson(json['sender'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReceivedMessageResponseModelToJson(
  ReceivedMessageResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'conversation_id': instance.conversationId,
  'sender_id': instance.senderId,
  'sender_type': instance.senderType,
  'message': instance.message,
  'read_at': instance.readAt,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'sender': instance.sender,
};
