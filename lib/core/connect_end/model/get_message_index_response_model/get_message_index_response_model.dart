import 'package:json_annotation/json_annotation.dart';
part 'get_message_index_response_model.g.dart';

class GetMessageIndexResponseModelList {
  final List<GetMessageIndexResponseModel>? getMessageIndexResponseModelList;

  GetMessageIndexResponseModelList({this.getMessageIndexResponseModelList});

  factory GetMessageIndexResponseModelList.fromJson(List<dynamic> parsedJson) {
    List<GetMessageIndexResponseModel> getMessageIndexResponseModel =
        parsedJson
            .map((i) => GetMessageIndexResponseModel.fromJson(i))
            .toList();

    return GetMessageIndexResponseModelList(
      getMessageIndexResponseModelList: getMessageIndexResponseModel,
    );
  }
}

@JsonSerializable()
class GetMessageIndexResponseModel {
  @JsonKey(name: 'conversation_id')
  num? conversationId;
  @JsonKey(name: 'contact_name')
  String? contactName;
  @JsonKey(name: 'contact_type')
  String? contactType;
  @JsonKey(name: 'contact_id')
  num? contactId;
  @JsonKey(name: 'last_message')
  String? lastMessage;
  @JsonKey(name: 'last_message_time')
  String? lastMessageTime;
  @JsonKey(name: 'unread_count')
  num? unreadCount;

  GetMessageIndexResponseModel({
    this.conversationId,
    this.contactName,
    this.contactType,
    this.contactId,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadCount,
  });

  factory GetMessageIndexResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetMessageIndexResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetMessageIndexResponseModelToJson(this);
}
