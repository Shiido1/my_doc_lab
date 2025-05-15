class AddMedicineEntityModel {
  String? name;
  String? volume;
  String? details;
  num? quantity;
  num? medicineCategoryId;
  num? price;
  String? status;
  String? type;
  String? expirationDate;

  AddMedicineEntityModel({
    this.name,
    this.volume,
    this.details,
    this.quantity,
    this.medicineCategoryId,
    this.price,
    this.status,
    this.type,
    this.expirationDate,
  });

  factory AddMedicineEntityModel.fromJson(Map<String, dynamic> json) {
    return AddMedicineEntityModel(
      name: json['name']?.toString(),
      volume: json['volume']?.toString(),
      details: json['details']?.toString(),
      quantity: num.tryParse(json['quantity'].toString()),
      medicineCategoryId: num.tryParse(json['medicine_category_id'].toString()),
      price: num.tryParse(json['price'].toString()),
      status: json['status']?.toString(),
      type: json['type']?.toString(),
      expirationDate: json['expiration_date']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (name != null) 'name': name,
    if (volume != null) 'volume': volume,
    if (details != null) 'details': details,
    if (quantity != null) 'quantity': quantity,
    if (medicineCategoryId != null) 'medicine_category_id': medicineCategoryId,
    if (price != null) 'price': price,
    if (status != null) 'status': status,
    if (type != null) 'type': type,
    if (expirationDate != null) 'expiration_date': expirationDate,
  };
}
