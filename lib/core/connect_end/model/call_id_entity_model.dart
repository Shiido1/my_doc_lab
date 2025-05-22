class CallIdEntityModel {
  num? callId;

  CallIdEntityModel({this.callId});

  factory CallIdEntityModel.fromJson(Map<String, dynamic> json) {
    return CallIdEntityModel(callId: num.tryParse(json['call_id'].toString()));
  }

  Map<String, dynamic> toJson() => {if (callId != null) 'call_id': callId};
}
