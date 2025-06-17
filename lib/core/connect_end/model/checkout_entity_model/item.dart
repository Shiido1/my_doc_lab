class Item {
  String? serviceType;
  num? serviceId;
  num? productId;
  num? qty;
  num? doctorId;
  num? slotId;
  num? labTechnicianId;
  String? complaint;
  String? date;
  String? time;

  Item({
    this.serviceType,
    this.serviceId,
    this.productId,
    this.qty,
    this.doctorId,
    this.slotId,
    this.labTechnicianId,
    this.complaint,
    this.date,
    this.time,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    serviceType: json['service_type']?.toString(),
    serviceId: num.tryParse(json['service_id'].toString()),
    productId: num.tryParse(json['product_id'].toString()),
    qty: num.tryParse(json['qty'].toString()),
    doctorId: num.tryParse(json['doctor_id'].toString()),
    slotId: num.tryParse(json['slot_id'].toString()),
    labTechnicianId: num.tryParse(json['lab_technician_id'].toString()),
    complaint: json['complaint']?.toString(),
    date: json['date']?.toString(),
    time: json['date']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (serviceType != null) 'service_type': serviceType,
    if (serviceId != null) 'service_id': serviceId,
    if (productId != null) 'product_id': productId,
    if (qty != null) 'qty': qty,
    if (doctorId != null) 'doctor_id': doctorId,
    if (slotId != null) 'slot_id': slotId,
    if (labTechnicianId != null) 'lab_technician_id': labTechnicianId,
    if (complaint != null) 'complaint': complaint,
    if (date != null) 'date': date,
    if (time != null) 'time': time,
  };
}
