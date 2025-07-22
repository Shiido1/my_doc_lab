// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharm_stats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmStatsResponseModel _$PharmStatsResponseModelFromJson(
  Map<String, dynamic> json,
) => PharmStatsResponseModel(
  balance: json['balance'] as num?,
  revenueToday: json['revenue_today'] as num?,
  availableMedicine: json['available_medicine'] as num?,
  medicineLow: json['medicine_low'] as num?,
);

Map<String, dynamic> _$PharmStatsResponseModelToJson(
  PharmStatsResponseModel instance,
) => <String, dynamic>{
  'balance': instance.balance,
  'revenue_today': instance.revenueToday,
  'available_medicine': instance.availableMedicine,
  'medicine_low': instance.medicineLow,
};
