import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_lab_tech_report_response_model.g.dart';

@JsonSerializable()
class GetLabTechReportResponseModel {
  List<Datum>? data;

  GetLabTechReportResponseModel({this.data});

  factory GetLabTechReportResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetLabTechReportResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetLabTechReportResponseModelToJson(this);
}
