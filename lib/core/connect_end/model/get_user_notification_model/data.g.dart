// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      orderItemIds: json['order_item_ids'],
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'order_item_ids': instance.orderItemIds,
      'status': instance.status,
      'message': instance.message,
    };
