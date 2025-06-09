// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallets _$WalletsFromJson(Map<String, dynamic> json) => Wallets(
      id: json['id'] as num?,
      uuid: json['uuid'] as String?,
      ownerId: json['ownerId'] as num?,
      ownerType: json['ownerType'] as String?,
      currencyId: json['currencyId'] as num?,
      balance: json['balance'] as num?,
      deletedAt: json['deletedAt'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WalletsToJson(Wallets instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'ownerId': instance.ownerId,
      'ownerType': instance.ownerType,
      'currencyId': instance.currencyId,
      'balance': instance.balance,
      'deletedAt': instance.deletedAt,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
