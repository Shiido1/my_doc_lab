import 'package:json_annotation/json_annotation.dart';

part 'pharm_stats_response_model.g.dart';

@JsonSerializable()
class PharmStatsResponseModel {
  num? balance;
  @JsonKey(name: 'revenue_today')
  num? revenueToday;
  @JsonKey(name: 'available_medicine')
  num? availableMedicine;
  @JsonKey(name: 'medicine_low')
  num? medicineLow;

  PharmStatsResponseModel({
    this.balance,
    this.revenueToday,
    this.availableMedicine,
    this.medicineLow,
  });

  factory PharmStatsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PharmStatsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PharmStatsResponseModelToJson(this);
}
