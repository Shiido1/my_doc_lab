import 'package:json_annotation/json_annotation.dart';

import 'history.dart';

part 'get_doctors_wallet_response_model.g.dart';

@JsonSerializable()
class GetDoctorsWalletResponseModel {
  num? id;
  num? balance;
  @JsonKey(name: 'owner_id')
  num? ownerId;
  List<History>? histories;

  GetDoctorsWalletResponseModel({
    this.id,
    this.balance,
    this.ownerId,
    this.histories,
  });

  factory GetDoctorsWalletResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetDoctorsWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDoctorsWalletResponseModelToJson(this);
}
