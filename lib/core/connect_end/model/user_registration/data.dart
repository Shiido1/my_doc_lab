import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? uuid;
  String? firstName;
  String? lastName;
  String? accountId;
  String? email;
  String? city;
  String? state;
  String? address;
  String? phone;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? id;
  String? classtype;
  dynamic age;

  Data({
    this.uuid,
    this.firstName,
    this.lastName,
    this.accountId,
    this.email,
    this.city,
    this.state,
    this.address,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.classtype,
    this.age,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
