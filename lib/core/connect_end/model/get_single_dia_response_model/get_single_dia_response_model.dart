import 'package:json_annotation/json_annotation.dart';

part 'get_single_dia_response_model.g.dart';

@JsonSerializable()
class GetSingleDiaResponseModel {
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

  GetSingleDiaResponseModel({
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
  });

  factory GetSingleDiaResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetSingleDiaResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSingleDiaResponseModelToJson(this);
}
