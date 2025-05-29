// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_token_generate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallTokenGenerateResponseModel _$CallTokenGenerateResponseModelFromJson(
        Map<String, dynamic> json) =>
    CallTokenGenerateResponseModel(
      token: json['token'] as String?,
      uid: json['uid'],
      channelName: json['channel_name'] as String?,
      callId: json['call_id'],
    );

Map<String, dynamic> _$CallTokenGenerateResponseModelToJson(
        CallTokenGenerateResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'uid': instance.uid,
      'channel_name': instance.channelName,
      'call_id': instance.callId,
    };
