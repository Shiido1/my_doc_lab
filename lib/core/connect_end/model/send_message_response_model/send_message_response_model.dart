import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'send_message_response_model.g.dart';

@JsonSerializable()
class SendMessageResponseModel {
  bool? success;
  Data? data;

  SendMessageResponseModel({this.success, this.data});

  factory SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SendMessageResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendMessageResponseModelToJson(this);
}
