import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String? status;
  Data? data;
  String? message;

  LoginResponseModel({this.status, this.data, this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
