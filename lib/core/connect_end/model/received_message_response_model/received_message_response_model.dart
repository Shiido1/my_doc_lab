import 'package:json_annotation/json_annotation.dart';
import 'sender.dart';
part 'received_message_response_model.g.dart';

class ReceivedMessageResponseModelList {
  final List<ReceivedMessageResponseModel>? receivedMessageResponseModelList;

  ReceivedMessageResponseModelList({this.receivedMessageResponseModelList});

  factory ReceivedMessageResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<ReceivedMessageResponseModel> receivedMessageResponseModel =
        parsedJson
            .map((i) => ReceivedMessageResponseModel.fromJson(i))
            .toList();

    return ReceivedMessageResponseModelList(
      receivedMessageResponseModelList: receivedMessageResponseModel,
    );
  }
}

@JsonSerializable()
class ReceivedMessageResponseModel {
  num? id;
  @JsonKey(name: 'conversation_id')
  num? conversationId;
  @JsonKey(name: 'sender_id')
  num? senderId;
  @JsonKey(name: 'sender_type')
  String? senderType;
  String? message;
  @JsonKey(name: 'read_at')
  dynamic readAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  Sender? sender;

  ReceivedMessageResponseModel({
    this.id,
    this.conversationId,
    this.senderId,
    this.senderType,
    this.message,
    this.readAt,
    this.createdAt,
    this.updatedAt,
    this.sender,
  });

  factory ReceivedMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ReceivedMessageResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReceivedMessageResponseModelToJson(this);
}
