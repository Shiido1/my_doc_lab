class CallEntityModel {
  num? callId;
  num? conversationId;
  num? receiverId;
  String? receiverType;

  CallEntityModel({
    this.callId,
    this.conversationId,
    this.receiverId,
    this.receiverType,
  });

  factory CallEntityModel.fromJson(Map<String, dynamic> json) {
    return CallEntityModel(
      callId: num.tryParse(json['call_id'].toString()),
      conversationId: num.tryParse(json['conversation_id'].toString()),
      receiverId: num.tryParse(json['receiver_id'].toString()),
      receiverType: json['receiver_type']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (callId != null) 'call_id': callId,
    if (conversationId != null) 'conversation_id': conversationId,
    if (receiverId != null) 'receiver_id': receiverId,
    if (receiverType != null) 'receiver_type': receiverType,
  };
}
