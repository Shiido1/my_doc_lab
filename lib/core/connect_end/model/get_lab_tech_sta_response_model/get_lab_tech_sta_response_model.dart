import 'package:json_annotation/json_annotation.dart';

part 'get_lab_tech_sta_response_model.g.dart';

@JsonSerializable()
class GetLabTechStaResponseModel {
  num? appointment;
  num? patients;
  @JsonKey(name: 'total_diagnosis')
  num? totalDiagnosis;

  GetLabTechStaResponseModel({
    this.appointment,
    this.patients,
    this.totalDiagnosis,
  });

  factory GetLabTechStaResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetLabTechStaResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetLabTechStaResponseModelToJson(this);
}
