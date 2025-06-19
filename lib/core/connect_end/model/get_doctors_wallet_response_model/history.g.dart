// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
  id: json['id'] as num?,
  walletId: json['wallet_id'] as num?,
  amount: json['amount'] as String?,
  type: json['type'] as String?,
  status: json['status'] as String?,
  reference: json['reference'] as String?,
  description: json['description'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
  'id': instance.id,
  'wallet_id': instance.walletId,
  'amount': instance.amount,
  'type': instance.type,
  'status': instance.status,
  'reference': instance.reference,
  'description': instance.description,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
