import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_report_response_model.g.dart';

@JsonSerializable()
class GetReportResponseModel {
  String? status;
  Data? data;

  GetReportResponseModel({this.status, this.data});

  factory GetReportResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetReportResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetReportResponseModelToJson(this);
}
