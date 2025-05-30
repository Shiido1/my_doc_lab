import 'package:json_annotation/json_annotation.dart';

part 'add_med_entity_model.g.dart';

@JsonSerializable()
class AddMedEntityModel {
  String? name;
  String? volume;
  String? details;
  num? quantity;
  @JsonKey(name: 'medicine_category_id')
  num? medicineCategoryId;
  num? price;
  String? status;
  String? type;
  @JsonKey(name: 'expiration_date')
  String? expirationDate;

  AddMedEntityModel({
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

  factory AddMedEntityModel.fromJson(Map<String, dynamic> json) {
    return _$AddMedEntityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddMedEntityModelToJson(this);
}
