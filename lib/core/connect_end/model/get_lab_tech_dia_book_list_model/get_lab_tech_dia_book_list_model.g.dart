// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lab_tech_dia_book_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLabTechDiaBookListModel _$GetLabTechDiaBookListModelFromJson(
  Map<String, dynamic> json,
) => GetLabTechDiaBookListModel(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetLabTechDiaBookListModelToJson(
  GetLabTechDiaBookListModel instance,
) => <String, dynamic>{'data': instance.data};
