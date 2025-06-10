import 'package:json_annotation/json_annotation.dart';

part 'lab_tech_category_list_response_model.g.dart';

@JsonSerializable()
class LabTechCategoryListResponseModel {
  num? id;
  String? name;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  LabTechCategoryListResponseModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory LabTechCategoryListResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LabTechCategoryListResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LabTechCategoryListResponseModelToJson(this);
  }
}
