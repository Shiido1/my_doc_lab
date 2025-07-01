import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_user_notification_model.g.dart';

class GetUserNotificationModelList {
  final List<GetUserNotificationModel>? getUserNotificationModelList;

  GetUserNotificationModelList({this.getUserNotificationModelList});

  factory GetUserNotificationModelList.fromJson(List<dynamic> parsedJson) {
    List<GetUserNotificationModel> getUserNotificationModel =
        parsedJson.map((i) => GetUserNotificationModel.fromJson(i)).toList();

    return GetUserNotificationModelList(
      getUserNotificationModelList: getUserNotificationModel,
    );
  }
}

@JsonSerializable()
class GetUserNotificationModel {
  String? id;
  String? type;
  @JsonKey(name: 'notifiable_type')
  String? notifiableType;
  @JsonKey(name: 'notifiable_id')
  num? notifiableId;
  Data? data;
  @JsonKey(name: 'read_at')
  dynamic readAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  GetUserNotificationModel({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory GetUserNotificationModel.fromJson(Map<String, dynamic> json) {
    return _$GetUserNotificationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserNotificationModelToJson(this);
}
