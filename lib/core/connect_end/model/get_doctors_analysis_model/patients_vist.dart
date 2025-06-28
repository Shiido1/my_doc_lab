import 'package:json_annotation/json_annotation.dart';

part 'patients_vist.g.dart';

@JsonSerializable()
class PatientsVist {
  String? month;
  num? total;

  PatientsVist({this.month, this.total});

  factory PatientsVist.fromJson(Map<String, dynamic> json) {
    return _$PatientsVistFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientsVistToJson(this);
}
