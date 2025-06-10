import 'package:json_annotation/json_annotation.dart';

import 'history.dart';

part 'lab_tech_wallet_response_model.g.dart';

@JsonSerializable()
class LabTechWalletResponseModel {
  num? id;
  num? balance;
  @JsonKey(name: 'owner_id')
  num? ownerId;
  List<History>? histories;

  LabTechWalletResponseModel({
    this.id,
    this.balance,
    this.ownerId,
    this.histories,
  });

  factory LabTechWalletResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LabTechWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LabTechWalletResponseModelToJson(this);
}
