import 'package:json_annotation/json_annotation.dart';

part 'age_distribution.g.dart';

@JsonSerializable()
class AgeDistribution {
  @JsonKey(name: '9-35')
  num? i935;

  AgeDistribution({this.i935});

  factory AgeDistribution.fromJson(Map<String, dynamic> json) {
    return _$AgeDistributionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgeDistributionToJson(this);
}
