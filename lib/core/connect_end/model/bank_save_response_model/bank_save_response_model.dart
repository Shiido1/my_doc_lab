import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'bank_save_response_model.g.dart';

@JsonSerializable()
class BankSaveResponseModel {
  String? status;
  String? message;
  Data? data;

  BankSaveResponseModel({this.status, this.message, this.data});

  factory BankSaveResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BankSaveResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankSaveResponseModelToJson(this);
}
