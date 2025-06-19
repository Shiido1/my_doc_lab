import 'package:json_annotation/json_annotation.dart';

import 'consultation.dart';
import 'doctor.dart';
import 'slot.dart';

part 'get_users_appointment_model.g.dart';

class GetUsersAppointmentModelList {
  final List<GetUsersAppointmentModel>? getUsersAppointmentModelList;

  GetUsersAppointmentModelList({this.getUsersAppointmentModelList});

  factory GetUsersAppointmentModelList.fromJson(List<dynamic> parsedJson) {
    List<GetUsersAppointmentModel> getUsersAppointmentModel =
        parsedJson.map((i) => GetUsersAppointmentModel.fromJson(i)).toList();

    return GetUsersAppointmentModelList(
      getUsersAppointmentModelList: getUsersAppointmentModel,
    );
  }
}

@JsonSerializable()
class GetUsersAppointmentModel {
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
  Doctor? doctor;
  Slot? slot;
  Consultation? consultation;

  GetUsersAppointmentModel({
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
    this.doctor,
    this.slot,
    this.consultation,
  });

  factory GetUsersAppointmentModel.fromJson(Map<String, dynamic> json) {
    return _$GetUsersAppointmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUsersAppointmentModelToJson(this);
}
