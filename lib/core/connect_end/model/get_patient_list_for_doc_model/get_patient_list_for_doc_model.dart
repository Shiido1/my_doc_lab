import 'package:json_annotation/json_annotation.dart';

import 'slot.dart';
import 'user.dart';

part 'get_patient_list_for_doc_model.g.dart';

class DocPatientListResponseModelList {
  final List<GetPatientListForDocModel>? docPatientListResponseModelList;

  DocPatientListResponseModelList({this.docPatientListResponseModelList});

  factory DocPatientListResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<GetPatientListForDocModel> docPatientListResponseModel =
        parsedJson.map((i) => GetPatientListForDocModel.fromJson(i)).toList();

    return DocPatientListResponseModelList(
      docPatientListResponseModelList: docPatientListResponseModel,
    );
  }
}

@JsonSerializable()
class GetPatientListForDocModel {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'slot_id')
  num? slotId;
  User? user;
  Slot? slot;

  GetPatientListForDocModel({
    this.id,
    this.userId,
    this.slotId,
    this.user,
    this.slot,
  });

  factory GetPatientListForDocModel.fromJson(Map<String, dynamic> json) {
    return _$GetPatientListForDocModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPatientListForDocModelToJson(this);
}
