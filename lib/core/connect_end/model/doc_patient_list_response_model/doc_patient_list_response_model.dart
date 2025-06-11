import 'package:json_annotation/json_annotation.dart';

import 'consultation.dart';
import 'user.dart';

part 'doc_patient_list_response_model.g.dart';

class DocPatientListResponseModelList {
  final List<DocPatientListResponseModel>? docPatientListResponseModelList;

  DocPatientListResponseModelList({this.docPatientListResponseModelList});

  factory DocPatientListResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<DocPatientListResponseModel> docPatientListResponseModel =
        parsedJson.map((i) => DocPatientListResponseModel.fromJson(i)).toList();

    return DocPatientListResponseModelList(
      docPatientListResponseModelList: docPatientListResponseModel,
    );
  }
}

@JsonSerializable()
class DocPatientListResponseModel {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'doctor_id')
  num? doctorId;
  @JsonKey(name: 'service_type')
  String? serviceType;
  String? message;
  @JsonKey(name: 'slot_id')
  num? slotId;
  @JsonKey(name: 'order_id')
  num? orderId;
  String? status;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  User? user;
  Consultation? consultation;

  DocPatientListResponseModel({
    this.id,
    this.userId,
    this.doctorId,
    this.serviceType,
    this.message,
    this.slotId,
    this.orderId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.consultation,
  });

  factory DocPatientListResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DocPatientListResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocPatientListResponseModelToJson(this);
}
