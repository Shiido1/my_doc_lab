class SendMessageEntityModel {
  num? conversationId;
  num? receiverId;
  String? receiverType;
  String? message;

  SendMessageEntityModel({
    this.conversationId,
    this.receiverId,
    this.receiverType,
    this.message,
  });

  factory SendMessageEntityModel.fromJson(Map<String, dynamic> json) {
    return SendMessageEntityModel(
      conversationId: num.tryParse(json['conversation_id'].toString()),
      receiverId: num.tryParse(json['receiver_id'].toString()),
      receiverType: json['receiver_type']?.toString(),
      message: json['message']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (conversationId != null) 'conversation_id': conversationId,
    if (receiverId != null) 'receiver_id': receiverId,
    if (receiverType != null) 'receiver_type': receiverType,
    if (message != null) 'message': message,
  };
}
