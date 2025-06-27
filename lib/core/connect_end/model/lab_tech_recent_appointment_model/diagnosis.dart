import 'package:json_annotation/json_annotation.dart';

part 'diagnosis.g.dart';

@JsonSerializable()
class Diagnosis {
  num? id;
  String? name;
  @JsonKey(name: 'category_name')
  dynamic categoryName;
  dynamic category;

  Diagnosis({this.id, this.name, this.categoryName, this.category});

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return _$DiagnosisFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiagnosisToJson(this);
}
