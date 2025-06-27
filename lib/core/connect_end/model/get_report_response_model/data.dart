import 'package:json_annotation/json_annotation.dart';

import 'report.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Report>? reports;

  Data({this.reports});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
