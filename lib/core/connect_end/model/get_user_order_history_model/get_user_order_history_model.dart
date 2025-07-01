import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'get_user_order_history_model.g.dart';

class GetUserOrderHistoryModelList {
  final List<GetUserOrderHistoryModel>? getUserOrderHistoryModelList;

  GetUserOrderHistoryModelList({this.getUserOrderHistoryModelList});

  factory GetUserOrderHistoryModelList.fromJson(List<dynamic> parsedJson) {
    List<GetUserOrderHistoryModel> getUserOrderHistoryModel =
        parsedJson.map((i) => GetUserOrderHistoryModel.fromJson(i)).toList();

    return GetUserOrderHistoryModelList(
      getUserOrderHistoryModelList: getUserOrderHistoryModel,
    );
  }
}

@JsonSerializable()
class GetUserOrderHistoryModel {
  num? id;
  @JsonKey(name: 'user_id')
  num? userId;
  @JsonKey(name: 'order_trx')
  String? orderTrx;
  String? status;
  @JsonKey(name: 'total_amount')
  String? totalAmount;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  List<Item>? items;

  GetUserOrderHistoryModel({
    this.id,
    this.userId,
    this.orderTrx,
    this.status,
    this.totalAmount,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory GetUserOrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserOrderHistoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserOrderHistoryModelToJson(this);
}
