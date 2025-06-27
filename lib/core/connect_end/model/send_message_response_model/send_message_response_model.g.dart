// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageResponseModel _$SendMessageResponseModelFromJson(
  Map<String, dynamic> json,
) => SendMessageResponseModel(
  success: json['success'] as bool?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SendMessageResponseModelToJson(
  SendMessageResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
