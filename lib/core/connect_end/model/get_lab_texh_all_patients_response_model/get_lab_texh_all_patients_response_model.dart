import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'get_lab_texh_all_patients_response_model.g.dart';

class GetLabTexhAllPatientsResponseModelList {
  final List<GetLabTexhAllPatientsResponseModel>?
  getLabTexhAllPatientsResponseModelList;

  GetLabTexhAllPatientsResponseModelList({
    this.getLabTexhAllPatientsResponseModelList,
  });

  factory GetLabTexhAllPatientsResponseModelList.fromJson(
    List<dynamic> parsedJson,
  ) {
    List<GetLabTexhAllPatientsResponseModel>
    getLabTexhAllPatientsResponseModel =
        parsedJson
            .map((i) => GetLabTexhAllPatientsResponseModel.fromJson(i))
            .toList();

    return GetLabTexhAllPatientsResponseModelList(
      getLabTexhAllPatientsResponseModelList:
          getLabTexhAllPatientsResponseModel,
    );
  }
}

@JsonSerializable()
class GetLabTexhAllPatientsResponseModel {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'diagnosis_id')
  num? diagnosisId;
  @JsonKey(name: 'doctor_id')
  num? doctorId;
  @JsonKey(name: 'booking_id')
  num? bookingId;
  @JsonKey(name: 'lab_technician_id')
  num? labTechnicianId;
  String? status;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  String? summary;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  User? user;

  GetLabTexhAllPatientsResponseModel({
    this.id,
    this.userId,
    this.diagnosisId,
    this.doctorId,
    this.bookingId,
    this.labTechnicianId,
    this.status,
    this.imageUrl,
    this.summary,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory GetLabTexhAllPatientsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetLabTexhAllPatientsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetLabTexhAllPatientsResponseModelToJson(this);
  }
}
