// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_notitfication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserNotitficationModel _$GetUserNotitficationModelFromJson(
        Map<String, dynamic> json) =>
    GetUserNotitficationModel(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      orderTrx: json['order_trx'] as String?,
      status: json['status'] as String?,
      totalAmount: json['total_amount'] as String?,
      paymentMethod: json['payment_method'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$GetUserNotitficationModelToJson(
        GetUserNotitficationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'order_trx': instance.orderTrx,
      'status': instance.status,
      'total_amount': instance.totalAmount,
      'payment_method': instance.paymentMethod,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
