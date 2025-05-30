import 'package:json_annotation/json_annotation.dart';

import 'consultation.dart';
import 'slot.dart';
import 'user.dart';

part 'get_list_of_doctors_appointment_model.g.dart';

@JsonSerializable()
class GetListOfDoctorsAppointmentModel {
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
  dynamic orderId;
  String? status;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  User? user;
  Slot? slot;
  Consultation? consultation;

  GetListOfDoctorsAppointmentModel({
    this.id,
    this.userId,
    this.doctorId,
    this.serviceType,
    this.message,
    this.slotId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.slot,
    this.consultation,
  });

  factory GetListOfDoctorsAppointmentModel.fromJson(Map<String, dynamic> json) {
    return _$GetListOfDoctorsAppointmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetListOfDoctorsAppointmentModelToJson(this);
  }
}

class GetListOfDoctorsAppointmentModelList {
  final List<GetListOfDoctorsAppointmentModel>? getListOfDoctorsAppointments;

  GetListOfDoctorsAppointmentModelList({this.getListOfDoctorsAppointments});

  factory GetListOfDoctorsAppointmentModelList.fromJson(
    List<dynamic> parsedJson,
  ) {
    List<GetListOfDoctorsAppointmentModel> getListOfDoctorsAppointmentModel =
        parsedJson
            .map((i) => GetListOfDoctorsAppointmentModel.fromJson(i))
            .toList();

    return GetListOfDoctorsAppointmentModelList(
      getListOfDoctorsAppointments: getListOfDoctorsAppointmentModel,
    );
  }
}
