import 'package:json_annotation/json_annotation.dart';

part 'medicine.g.dart';

@JsonSerializable()
class Medicine {
  num? id;
  String? name;
  String? volume;
  String? details;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'medicine_category_id')
  num? medicineCategoryId;
  String? type;
  num? quantity;
  num? price;
  String? status;
  @JsonKey(name: 'expiration_date')
  String? expirationDate;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  Medicine({
    this.id,
    this.name,
    this.volume,
    this.details,
    this.userId,
    this.medicineCategoryId,
    this.type,
    this.quantity,
    this.price,
    this.status,
    this.expirationDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return _$MedicineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicineToJson(this);
}
