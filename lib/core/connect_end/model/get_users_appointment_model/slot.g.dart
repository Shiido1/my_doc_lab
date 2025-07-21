// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      id: json['id'] as num?,
      availableDate: json['available_date'] == null
          ? null
          : DateTime.parse(json['available_date'] as String),
      availableTime: json['available_time'] as String?,
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'id': instance.id,
      'available_date': instance.availableDate?.toIso8601String(),
      'available_time': instance.availableTime,
    };
