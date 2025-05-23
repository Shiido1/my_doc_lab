import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_user_response_model.g.dart';

@JsonSerializable()
class UpdateUserResponseModel {
  String? status;
  Data? data;

  UpdateUserResponseModel({this.status, this.data});

  factory UpdateUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateUserResponseModelToJson(this);
}
