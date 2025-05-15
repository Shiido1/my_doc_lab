import 'package:json_annotation/json_annotation.dart';

part 'get_all_medicine_response_model.g.dart';

@JsonSerializable()
class GetAllMedicineResponseModel {
  num? id;
  String? name;
  String? volume;
  String? details;
  @JsonKey(name: 'medicine_category_id')
  num? medicineCategoryId;
  String? type;
  @JsonKey(name: 'user_id')
  num? userId;
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

  GetAllMedicineResponseModel({
    this.id,
    this.name,
    this.volume,
    this.details,
    this.medicineCategoryId,
    this.type,
    this.userId,
    this.quantity,
    this.price,
    this.status,
    this.expirationDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory GetAllMedicineResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllMedicineResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllMedicineResponseModelToJson(this);
}
