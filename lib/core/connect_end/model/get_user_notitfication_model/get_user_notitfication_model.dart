import 'package:json_annotation/json_annotation.dart';

part 'get_user_notitfication_model.g.dart';

class GetUserNotitficationModelList {
  final List<GetUserNotitficationModel>? getUserNotitficationModelList;

  GetUserNotitficationModelList({this.getUserNotitficationModelList});

  factory GetUserNotitficationModelList.fromJson(List<dynamic> parsedJson) {
    List<GetUserNotitficationModel> getUserNotitficationModel =
        parsedJson.map((i) => GetUserNotitficationModel.fromJson(i)).toList();

    return GetUserNotitficationModelList(
      getUserNotitficationModelList: getUserNotitficationModel,
    );
  }
}

@JsonSerializable()
class GetUserNotitficationModel {
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

  GetUserNotitficationModel({
    this.id,
    this.userId,
    this.orderTrx,
    this.status,
    this.totalAmount,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
  });

  factory GetUserNotitficationModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserNotitficationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserNotitficationModelToJson(this);
}
