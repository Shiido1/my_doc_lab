// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_med_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMedEntityModel _$AddMedEntityModelFromJson(Map<String, dynamic> json) =>
    AddMedEntityModel(
      name: json['name'] as String?,
      volume: json['volume'] as String?,
      details: json['details'] as String?,
      quantity: json['quantity'] as num?,
      medicineCategoryId: json['medicine_category_id'] as num?,
      price: json['price'] as num?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      expirationDate: json['expiration_date'] as String?,
    );

Map<String, dynamic> _$AddMedEntityModelToJson(AddMedEntityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'volume': instance.volume,
      'details': instance.details,
      'quantity': instance.quantity,
      'medicine_category_id': instance.medicineCategoryId,
      'price': instance.price,
      'status': instance.status,
      'type': instance.type,
      'expiration_date': instance.expirationDate,
    };
