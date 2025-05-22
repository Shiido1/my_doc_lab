import 'package:json_annotation/json_annotation.dart';

part 'call_token_generate_response_model.g.dart';

@JsonSerializable()
class CallTokenGenerateResponseModel {
  String? token;
  num? uid;
  @JsonKey(name: 'channel_name')
  String? channelName;
  @JsonKey(name: 'call_id')
  num? callId;

  CallTokenGenerateResponseModel({
    this.token,
    this.uid,
    this.channelName,
    this.callId,
  });

  factory CallTokenGenerateResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CallTokenGenerateResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CallTokenGenerateResponseModelToJson(this);
  }
}
