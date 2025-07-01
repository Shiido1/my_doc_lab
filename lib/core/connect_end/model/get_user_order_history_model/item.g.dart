// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as num?,
      orderId: json['order_id'] as num?,
      serviceType: json['service_type'] as String?,
      serviceId: json['service_id'] as num?,
      giverId: json['giver_id'] as num?,
      quantity: json['quantity'] as num?,
      price: json['price'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      serviceName: json['service_name'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'service_type': instance.serviceType,
      'service_id': instance.serviceId,
      'giver_id': instance.giverId,
      'quantity': instance.quantity,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'service_name': instance.serviceName,
    };
