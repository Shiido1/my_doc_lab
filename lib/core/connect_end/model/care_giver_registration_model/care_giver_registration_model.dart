import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'care_giver_registration_model.g.dart';

@JsonSerializable()
class CareGiverRegistrationModel {
  String? status;
  Data? data;

  CareGiverRegistrationModel({this.status, this.data});

  factory CareGiverRegistrationModel.fromJson(Map<String, dynamic> json) {
    return _$CareGiverRegistrationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CareGiverRegistrationModelToJson(this);
}
