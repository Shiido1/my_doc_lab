import 'package:json_annotation/json_annotation.dart';

part 'searched_medicine_response_model.g.dart';

class SearchedMedicineResponseModelList {
  final List<SearchedMedicineResponseModel>? searchedMedicineResponseModelList;

  SearchedMedicineResponseModelList({this.searchedMedicineResponseModelList});

  factory SearchedMedicineResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<SearchedMedicineResponseModel> searchedMedicineResponseModel =
        parsedJson
            .map((i) => SearchedMedicineResponseModel.fromJson(i))
            .toList();

    return SearchedMedicineResponseModelList(
      searchedMedicineResponseModelList: searchedMedicineResponseModel,
    );
  }
}

@JsonSerializable()
class SearchedMedicineResponseModel {
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

  SearchedMedicineResponseModel({
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

  factory SearchedMedicineResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SearchedMedicineResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchedMedicineResponseModelToJson(this);
}
