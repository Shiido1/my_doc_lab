import 'package:json_annotation/json_annotation.dart';

part 'get_med_by_id_response_model.g.dart';

@JsonSerializable()
class GetMedByIdResponseModel {
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

  GetMedByIdResponseModel({
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

  factory GetMedByIdResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetMedByIdResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetMedByIdResponseModelToJson(this);
}
