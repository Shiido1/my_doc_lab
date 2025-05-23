class Item {
  String? serviceType;
  num? serviceId;
  num? productId;
  num? qty;
  num? doctorId;
  num? slotId;
  String? complaint;

  Item({
    this.serviceType,
    this.serviceId,
    this.productId,
    this.qty,
    this.doctorId,
    this.slotId,
    this.complaint,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    serviceType: json['service_type']?.toString(),
    serviceId: num.tryParse(json['service_id'].toString()),
    productId: num.tryParse(json['product_id'].toString()),
    qty: num.tryParse(json['qty'].toString()),
    doctorId: num.tryParse(json['doctor_id'].toString()),
    slotId: num.tryParse(json['slot_id'].toString()),
    complaint: json['complaint']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (serviceType != null) 'service_type': serviceType,
    if (serviceId != null) 'service_id': serviceId,
    if (productId != null) 'product_id': productId,
    if (qty != null) 'qty': qty,
    if (doctorId != null) 'doctor_id': doctorId,
    if (slotId != null) 'slot_id': slotId,
    if (complaint != null) 'complaint': complaint,
  };
}
