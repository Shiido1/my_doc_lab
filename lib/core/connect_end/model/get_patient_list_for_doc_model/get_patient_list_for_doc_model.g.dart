// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_patient_list_for_doc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPatientListForDocModel _$GetPatientListForDocModelFromJson(
        Map<String, dynamic> json) =>
    GetPatientListForDocModel(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      slotId: json['slot_id'] as num?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      slot: json['slot'] == null
          ? null
          : Slot.fromJson(json['slot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPatientListForDocModelToJson(
        GetPatientListForDocModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'slot_id': instance.slotId,
      'user': instance.user,
      'slot': instance.slot,
    };
