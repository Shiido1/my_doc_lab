import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'get_list_of_lab_diagnosis_model.g.dart';

class GetListOfLabDiagnosisModelList {
  final List<GetListOfLabDiagnosisModel>? getListOfLabDiagnosisModelList;

  GetListOfLabDiagnosisModelList({this.getListOfLabDiagnosisModelList});

  factory GetListOfLabDiagnosisModelList.fromJson(List<dynamic> parsedJson) {
    List<GetListOfLabDiagnosisModel> getListOfLabDiagnosisModel =
        parsedJson.map((i) => GetListOfLabDiagnosisModel.fromJson(i)).toList();

    return GetListOfLabDiagnosisModelList(
      getListOfLabDiagnosisModelList: getListOfLabDiagnosisModel,
    );
  }
}

@JsonSerializable()
class GetListOfLabDiagnosisModel {
  num? id;
  String? name;
  String? details;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'diagnosis_category_id')
  num? diagnosisCategoryId;
  String? turnaround;
  num? price;
  @JsonKey(name: 'group_type')
  String? groupType;
  String? status;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'category_name')
  String? categoryName;
  Category? category;

  GetListOfLabDiagnosisModel({
    this.id,
    this.name,
    this.details,
    this.userId,
    this.diagnosisCategoryId,
    this.turnaround,
    this.price,
    this.groupType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.categoryName,
    this.category,
  });

  factory GetListOfLabDiagnosisModel.fromJson(Map<String, dynamic> json) {
    return _$GetListOfLabDiagnosisModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetListOfLabDiagnosisModelToJson(this);
}
