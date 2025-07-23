import 'package:json_annotation/json_annotation.dart';

import 'note.dart';

part 'get_doctors_note_model.g.dart';

@JsonSerializable()
class GetDoctorsNoteModel {
  List<Note>? notes;

  GetDoctorsNoteModel({this.notes});

  factory GetDoctorsNoteModel.fromJson(Map<String, dynamic> json) {
    return _$GetDoctorsNoteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDoctorsNoteModelToJson(this);
}
