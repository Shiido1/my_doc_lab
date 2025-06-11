import 'package:json_annotation/json_annotation.dart';

part 'lab_tech_category_list_response_model.g.dart';

class LabTechCategoryListResponseModelList {
  final List<LabTechCategoryListResponseModel>?
  labTechCategoryListResponseModelList;

  LabTechCategoryListResponseModelList({
    this.labTechCategoryListResponseModelList,
  });

  factory LabTechCategoryListResponseModelList.fromJson(
    List<dynamic> parsedJson,
  ) {
    List<LabTechCategoryListResponseModel> labTechCategoryListResponseModel =
        parsedJson
            .map((i) => LabTechCategoryListResponseModel.fromJson(i))
            .toList();

    return LabTechCategoryListResponseModelList(
      labTechCategoryListResponseModelList: labTechCategoryListResponseModel,
    );
  }
}

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
