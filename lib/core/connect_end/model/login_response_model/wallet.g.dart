// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      id: json['id'] as num?,
      uuid: json['uuid'] as String?,
      userId: json['userId'] as num?,
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

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'userId': instance.userId,
      'currencyId': instance.currencyId,
      'balance': instance.balance,
      'deletedAt': instance.deletedAt,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
