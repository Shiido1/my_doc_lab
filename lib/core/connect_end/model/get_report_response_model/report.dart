import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  String? doctor;
  String? diagnosis;
  String? summary;
  String? status;
  String? imageUrl;
  DateTime? date;

  Report({
    this.doctor,
    this.diagnosis,
    this.summary,
    this.status,
    this.imageUrl,
    this.date,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return _$ReportFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
