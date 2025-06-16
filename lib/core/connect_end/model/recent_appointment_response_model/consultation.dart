import 'package:json_annotation/json_annotation.dart';

part 'consultation.g.dart';

@JsonSerializable()
class Consultation {
  num? id;
  String? name;

  Consultation({this.id, this.name});

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return _$ConsultationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConsultationToJson(this);
}
