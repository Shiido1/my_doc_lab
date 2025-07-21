import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_specialization_response_model.g.dart';

@JsonSerializable()
class GetSpecializationResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;
  @JsonKey(name: 'status_code')
  num? statusCode;

  GetSpecializationResponseModel({
    this.status,
    this.message,
    this.data,
    this.statusCode,
  });

  factory GetSpecializationResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetSpecializationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSpecializationResponseModelToJson(this);
  }
}
