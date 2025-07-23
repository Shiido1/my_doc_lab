// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctors_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorsNoteModel _$GetDoctorsNoteModelFromJson(Map<String, dynamic> json) =>
    GetDoctorsNoteModel(
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDoctorsNoteModelToJson(
        GetDoctorsNoteModel instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
