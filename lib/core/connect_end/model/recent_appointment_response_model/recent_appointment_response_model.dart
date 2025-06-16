import 'package:json_annotation/json_annotation.dart';

import 'consultation.dart';
import 'user.dart';

part 'recent_appointment_response_model.g.dart';

class RecentAppointmentResponseModelList {
  final List<RecentAppointmentResponseModel>?
  recentAppointmentResponseModelList;

  RecentAppointmentResponseModelList({this.recentAppointmentResponseModelList});

  factory RecentAppointmentResponseModelList.fromJson(
    List<dynamic> parsedJson,
  ) {
    List<RecentAppointmentResponseModel> recentAppointmentResponseModel =
        parsedJson
            .map((i) => RecentAppointmentResponseModel.fromJson(i))
            .toList();

    return RecentAppointmentResponseModelList(
      recentAppointmentResponseModelList: recentAppointmentResponseModel,
    );
  }
}

@JsonSerializable()
class RecentAppointmentResponseModel {
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

  RecentAppointmentResponseModel({
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

  factory RecentAppointmentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RecentAppointmentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecentAppointmentResponseModelToJson(this);
  }
}
