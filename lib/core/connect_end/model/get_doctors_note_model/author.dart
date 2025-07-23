import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  num? id;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;

  Author({this.id, this.firstName, this.lastName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return _$AuthorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
