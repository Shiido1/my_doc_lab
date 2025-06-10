import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'lab_tech_detail_response_model.g.dart';

@JsonSerializable()
class LabTechDetailResponseModel {
  List<Datum>? data;

  LabTechDetailResponseModel({this.data});

  factory LabTechDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LabTechDetailResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LabTechDetailResponseModelToJson(this);
}
