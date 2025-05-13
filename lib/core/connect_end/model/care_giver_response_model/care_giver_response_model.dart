import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'care_giver_response_model.g.dart';

@JsonSerializable()
class CareGiverResponseModel {
  String? status;
  Data? data;
  String? message;

  CareGiverResponseModel({this.status, this.data, this.message});

  factory CareGiverResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CareGiverResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CareGiverResponseModelToJson(this);
}
