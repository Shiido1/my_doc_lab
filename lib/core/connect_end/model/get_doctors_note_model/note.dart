import 'package:json_annotation/json_annotation.dart';

import 'author.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  num? id;
  @JsonKey(name: 'call_id')
  num? callId;
  @JsonKey(name: 'author_id')
  num? authorId;
  @JsonKey(name: 'author_type')
  String? authorType;
  @JsonKey(name: 'user_id')
  num? userId;
  String? note;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  Author? author;

  Note({
    this.id,
    this.callId,
    this.authorId,
    this.authorType,
    this.userId,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.author,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
