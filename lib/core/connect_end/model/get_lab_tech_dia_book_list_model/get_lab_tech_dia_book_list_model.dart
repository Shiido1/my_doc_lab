import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_lab_tech_dia_book_list_model.g.dart';

@JsonSerializable()
class GetLabTechDiaBookListModel {
  List<Datum>? data;

  GetLabTechDiaBookListModel({this.data});

  factory GetLabTechDiaBookListModel.fromJson(Map<String, dynamic> json) {
    return _$GetLabTechDiaBookListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetLabTechDiaBookListModelToJson(this);
}
