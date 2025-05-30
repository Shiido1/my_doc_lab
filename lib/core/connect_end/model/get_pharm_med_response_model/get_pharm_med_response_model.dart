import 'package:json_annotation/json_annotation.dart';

part 'get_pharm_med_response_model.g.dart';

class GetPharmMedResponseModelList {
  final List<GetPharmMedResponseModel>? getPharmMedResponseModelList;

  GetPharmMedResponseModelList({this.getPharmMedResponseModelList});

  factory GetPharmMedResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<GetPharmMedResponseModel> getPharmacyMedResponseModel =
        parsedJson.map((i) => GetPharmMedResponseModel.fromJson(i)).toList();

    return GetPharmMedResponseModelList(
      getPharmMedResponseModelList: getPharmacyMedResponseModel,
    );
  }
}

@JsonSerializable()
class GetPharmMedResponseModel {
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

  GetPharmMedResponseModel({
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

  factory GetPharmMedResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPharmMedResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPharmMedResponseModelToJson(this);
}
