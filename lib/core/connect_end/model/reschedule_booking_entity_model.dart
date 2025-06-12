class RescheduleBookingEntityModel {
  String? reason;
  num? slotId;

  RescheduleBookingEntityModel({this.reason, this.slotId});

  factory RescheduleBookingEntityModel.fromJson(Map<String, dynamic> json) {
    return RescheduleBookingEntityModel(
      reason: json['reason']?.toString(),
      slotId: num.tryParse(json['slot_id'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    if (reason != null) 'reason': reason,
    if (slotId != null) 'slot_id': slotId,
  };
}
