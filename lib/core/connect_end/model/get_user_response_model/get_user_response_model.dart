import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_user_response_model.g.dart';

@JsonSerializable()
class GetUserResponseModel {
  String? status;
  Data? data;

  GetUserResponseModel({this.status, this.data});

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserResponseModelToJson(this);
}
