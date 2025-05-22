class CallTokenGenerateEntityModel {
  num? conversationId;
  num? receiverId;
  String? receiverType;

  CallTokenGenerateEntityModel({
    this.conversationId,
    this.receiverId,
    this.receiverType,
  });

  factory CallTokenGenerateEntityModel.fromJson(Map<String, dynamic> json) {
    return CallTokenGenerateEntityModel(
      conversationId: num.tryParse(json['conversation_id'].toString()),
      receiverId: num.tryParse(json['receiver_id'].toString()),
      receiverType: json['receiver_type']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (conversationId != null) 'conversation_id': conversationId,
    if (receiverId != null) 'receiver_id': receiverId,
    if (receiverType != null) 'receiver_type': receiverType,
  };
}
