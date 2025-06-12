import 'package:json_annotation/json_annotation.dart';

import 'doctor.dart';
import 'drug.dart';
import 'user.dart';

part 'get_prescription_list_response_model.g.dart';

class GetPrescriptionListResponseModelList {
  final List<GetPrescriptionListResponseModel>?
  getPrescriptionListResponseModelList;

  GetPrescriptionListResponseModelList({
    this.getPrescriptionListResponseModelList,
  });

  factory GetPrescriptionListResponseModelList.fromJson(
    List<dynamic> parsedJson,
  ) {
    List<GetPrescriptionListResponseModel> getPrescriptionListResponseModel =
        parsedJson
            .map((i) => GetPrescriptionListResponseModel.fromJson(i))
            .toList();

    return GetPrescriptionListResponseModelList(
      getPrescriptionListResponseModelList: getPrescriptionListResponseModel,
    );
  }
}

@JsonSerializable()
class GetPrescriptionListResponseModel {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'doctor_id')
  num? doctorId;
  String? notes;
  dynamic file;
  String? status;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  List<Drug>? drugs;
  User? user;
  Doctor? doctor;

  GetPrescriptionListResponseModel({
    this.id,
    this.userId,
    this.doctorId,
    this.notes,
    this.file,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.drugs,
    this.user,
    this.doctor,
  });

  factory GetPrescriptionListResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPrescriptionListResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetPrescriptionListResponseModelToJson(this);
  }
}
