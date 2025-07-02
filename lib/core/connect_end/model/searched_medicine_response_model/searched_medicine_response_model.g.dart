// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_medicine_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedMedicineResponseModel _$SearchedMedicineResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchedMedicineResponseModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      volume: json['volume'] as String?,
      details: json['details'] as String?,
      medicineCategoryId: json['medicine_category_id'] as num?,
      type: json['type'] as String?,
      userId: json['user_id'] as num?,
      quantity: json['quantity'] as num?,
      price: json['price'] as num?,
      status: json['status'] as String?,
      expirationDate: json['expiration_date'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$SearchedMedicineResponseModelToJson(
        SearchedMedicineResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'volume': instance.volume,
      'details': instance.details,
      'medicine_category_id': instance.medicineCategoryId,
      'type': instance.type,
      'user_id': instance.userId,
      'quantity': instance.quantity,
      'price': instance.price,
      'status': instance.status,
      'expiration_date': instance.expirationDate,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
