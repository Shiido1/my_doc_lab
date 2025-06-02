import 'package:json_annotation/json_annotation.dart';

import 'history.dart';

part 'get_pharm_wallet_response_model.g.dart';

@JsonSerializable()
class GetPharmWalletResponseModel {
  num? id;
  num? balance;
  @JsonKey(name: 'owner_id')
  num? ownerId;
  List<History>? histories;

  GetPharmWalletResponseModel({
    this.id,
    this.balance,
    this.ownerId,
    this.histories,
  });

  factory GetPharmWalletResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPharmWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPharmWalletResponseModelToJson(this);
}
