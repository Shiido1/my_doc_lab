// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pharm_wallet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPharmWalletResponseModel _$GetPharmWalletResponseModelFromJson(
  Map<String, dynamic> json,
) => GetPharmWalletResponseModel(
  id: json['id'] as num?,
  balance: json['balance'] as num?,
  ownerId: json['owner_id'] as num?,
  histories:
      (json['histories'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetPharmWalletResponseModelToJson(
  GetPharmWalletResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'balance': instance.balance,
  'owner_id': instance.ownerId,
  'histories': instance.histories,
};
