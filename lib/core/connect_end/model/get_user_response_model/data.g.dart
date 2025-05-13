// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  uuid: json['uuid'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  gender: json['gender'],
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  status: json['status'] as String?,
  emailVerifiedAt:
      json['emailVerifiedAt'] == null
          ? null
          : DateTime.parse(json['emailVerifiedAt'] as String),
  accountId: json['accountId'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  address: json['address'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'],
  classtype: json['classtype'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'uuid': instance.uuid,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'gender': instance.gender,
  'email': instance.email,
  'phone': instance.phone,
  'status': instance.status,
  'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
  'accountId': instance.accountId,
  'city': instance.city,
  'state': instance.state,
  'address': instance.address,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt,
  'classtype': instance.classtype,
};
