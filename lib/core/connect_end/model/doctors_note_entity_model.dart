class DoctorsNoteEntityModel {
  num? callId;
  num? userId;
  String? note;

  DoctorsNoteEntityModel({this.callId, this.userId, this.note});

  factory DoctorsNoteEntityModel.fromJson(Map<String, dynamic> json) {
    return DoctorsNoteEntityModel(
      callId: num.tryParse(json['call_id'].toString()),
      userId: num.tryParse(json['user_id'].toString()),
      note: json['note']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (callId != null) 'call_id': callId,
    if (userId != null) 'user_id': userId,
    if (note != null) 'note': note,
  };
}
