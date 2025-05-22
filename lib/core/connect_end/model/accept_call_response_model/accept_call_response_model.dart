import 'package:json_annotation/json_annotation.dart';

import 'call.dart';

part 'accept_call_response_model.g.dart';

@JsonSerializable()
class AcceptCallResponseModel {
  String? message;
  Call? call;

  AcceptCallResponseModel({this.message, this.call});

  factory AcceptCallResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AcceptCallResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AcceptCallResponseModelToJson(this);
}
