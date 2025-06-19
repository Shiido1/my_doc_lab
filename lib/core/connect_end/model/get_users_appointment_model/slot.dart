import 'package:json_annotation/json_annotation.dart';

part 'slot.g.dart';

@JsonSerializable()
class Slot {
  num? id;
  @JsonKey(name: 'available_date')
  DateTime? availableDate;
  @JsonKey(name: 'available_time')
  String? availableTime;

  Slot({this.id, this.availableDate, this.availableTime});

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  Map<String, dynamic> toJson() => _$SlotToJson(this);
}
