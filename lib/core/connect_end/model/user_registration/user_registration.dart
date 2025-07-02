import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_registration.g.dart';

@JsonSerializable()
class UserRegistration {
  String? status;
  Data? data;

  UserRegistration({this.status, this.data});

  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return _$UserRegistrationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserRegistrationToJson(this);
}
