// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserNotificationModel _$GetUserNotificationModelFromJson(
  Map<String, dynamic> json,
) => GetUserNotificationModel(
  id: json['id'] as String?,
  type: json['type'] as String?,
  notifiableType: json['notifiable_type'] as String?,
  notifiableId: json['notifiable_id'] as num?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
  readAt: json['read_at'],
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$GetUserNotificationModelToJson(
  GetUserNotificationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'notifiable_type': instance.notifiableType,
  'notifiable_id': instance.notifiableId,
  'data': instance.data,
  'read_at': instance.readAt,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
