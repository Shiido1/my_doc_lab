// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_tech_wallet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTechWalletResponseModel _$LabTechWalletResponseModelFromJson(
  Map<String, dynamic> json,
) => LabTechWalletResponseModel(
  id: json['id'] as num?,
  balance: json['balance'] as num?,
  ownerId: json['owner_id'] as num?,
  histories:
      (json['histories'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$LabTechWalletResponseModelToJson(
  LabTechWalletResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'balance': instance.balance,
  'owner_id': instance.ownerId,
  'histories': instance.histories,
};
