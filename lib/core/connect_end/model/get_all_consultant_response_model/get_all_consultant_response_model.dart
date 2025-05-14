import 'package:json_annotation/json_annotation.dart';

part 'get_all_consultant_response_model.g.dart';

class GetAllConsultantResponseModelList {
  final List<GetAllConsultantResponseModel>? getAllConsultantResponseModelList;

  GetAllConsultantResponseModelList({this.getAllConsultantResponseModelList});

  factory GetAllConsultantResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<GetAllConsultantResponseModel> getAllConsultantResponseModel =
        parsedJson
            .map((i) => GetAllConsultantResponseModel.fromJson(i))
            .toList();

    return GetAllConsultantResponseModelList(
      getAllConsultantResponseModelList: getAllConsultantResponseModel,
    );
  }
}

@JsonSerializable()
class GetAllConsultantResponseModel {
  num? id;
  String? name;
  String? details;
  num? price;
  @JsonKey(name: 'include_details')
  String? includeDetails;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  GetAllConsultantResponseModel({
    this.id,
    this.name,
    this.details,
    this.price,
    this.includeDetails,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory GetAllConsultantResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllConsultantResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllConsultantResponseModelToJson(this);
}
