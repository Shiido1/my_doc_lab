class AddBookingEntityModel {
  num? doctorId;
  num? serviceType;
  num? slotId;
  String? complaint;

  AddBookingEntityModel({
    this.doctorId,
    this.serviceType,
    this.slotId,
    this.complaint,
  });

  factory AddBookingEntityModel.fromJson(Map<String, dynamic> json) {
    return AddBookingEntityModel(
      doctorId: num.tryParse(json['doctor_id'].toString()),
      serviceType: num.tryParse(json['service_type'].toString()),
      slotId: num.tryParse(json['slot_id'].toString()),
      complaint: json['complaint']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (doctorId != null) 'doctor_id': doctorId,
    if (serviceType != null) 'service_type': serviceType,
    if (slotId != null) 'slot_id': slotId,
    if (complaint != null) 'complaint': complaint,
  };
}
