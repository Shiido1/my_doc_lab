// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message_index_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessageIndexResponseModel _$GetMessageIndexResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetMessageIndexResponseModel(
      conversationId: json['conversation_id'] as num?,
      contactName: json['contact_name'] as String?,
      contactType: json['contact_type'] as String?,
      contactId: json['contact_id'],
      contactProfile: json['contact_profile'] as String?,
      lastMessage: json['last_message'] as String?,
      lastMessageTime: json['last_message_time'] as String?,
      unreadCount: json['unread_count'] as num?,
    );

Map<String, dynamic> _$GetMessageIndexResponseModelToJson(
        GetMessageIndexResponseModel instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'contact_name': instance.contactName,
      'contact_profile': instance.contactProfile,
      'contact_type': instance.contactType,
      'contact_id': instance.contactId,
      'last_message': instance.lastMessage,
      'last_message_time': instance.lastMessageTime,
      'unread_count': instance.unreadCount,
    };
