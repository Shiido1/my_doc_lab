import 'package:json_annotation/json_annotation.dart';

part 'get_single_category_detail_model.g.dart';

@JsonSerializable()
class GetSingleCategoryDetailModel {
  num? id;
  String? name;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  GetSingleCategoryDetailModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory GetSingleCategoryDetailModel.fromJson(Map<String, dynamic> json) {
    return _$GetSingleCategoryDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSingleCategoryDetailModelToJson(this);
}
