// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_med_by_id_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMedByIdResponseModel _$GetMedByIdResponseModelFromJson(
  Map<String, dynamic> json,
) => GetMedByIdResponseModel(
  id: json['id'] as num?,
  name: json['name'] as String?,
  volume: json['volume'] as String?,
  details: json['details'] as String?,
  userId: json['user_id'] as num?,
  medicineCategoryId: json['medicine_category_id'] as num?,
  type: json['type'] as String?,
  quantity: json['quantity'] as num?,
  price: json['price'] as num?,
  status: json['status'] as String?,
  expirationDate: json['expiration_date'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
);

Map<String, dynamic> _$GetMedByIdResponseModelToJson(
  GetMedByIdResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'volume': instance.volume,
  'details': instance.details,
  'user_id': instance.userId,
  'medicine_category_id': instance.medicineCategoryId,
  'type': instance.type,
  'quantity': instance.quantity,
  'price': instance.price,
  'status': instance.status,
  'expiration_date': instance.expirationDate,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
};
