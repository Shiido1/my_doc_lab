// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  uuid: json['uuid'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  accountId: json['accountId'] as String?,
  email: json['email'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  id: json['id'] as String?,
  classtype: json['classtype'] as String?,
  age: json['age'],
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'accountId': instance.accountId,
  'email': instance.email,
  'city': instance.city,
  'state': instance.state,
  'address': instance.address,
  'phone': instance.phone,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'id': instance.id,
  'classtype': instance.classtype,
  'age': instance.age,
};
