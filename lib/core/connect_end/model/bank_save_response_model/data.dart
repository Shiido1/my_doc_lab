import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'bank_code')
  String? bankCode;
  @JsonKey(name: 'account_name')
  String? accountName;

  Data({this.accountNumber, this.bankCode, this.accountName});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
