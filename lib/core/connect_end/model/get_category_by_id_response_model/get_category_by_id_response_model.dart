import 'package:json_annotation/json_annotation.dart';

part 'get_category_by_id_response_model.g.dart';

@JsonSerializable()
class GetCategoryByIdResponseModel {
  num? id;
  String? name;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  GetCategoryByIdResponseModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory GetCategoryByIdResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetCategoryByIdResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCategoryByIdResponseModelToJson(this);
}
