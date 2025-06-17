// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSearchResponseModel _$UserSearchResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserSearchResponseModel(
      id: json['id'] as String?,
      uuid: json['uuid'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      profileImage: json['profile_image'] as String?,
      status: json['status'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      accountId: json['account_id'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      address: json['address'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      classtype: json['classtype'] as String?,
      age: json['age'] as num?,
    );

Map<String, dynamic> _$UserSearchResponseModelToJson(
        UserSearchResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'dob': instance.dob,
      'email': instance.email,
      'phone': instance.phone,
      'profile_image': instance.profileImage,
      'status': instance.status,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'account_id': instance.accountId,
      'city': instance.city,
      'state': instance.state,
      'address': instance.address,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'classtype': instance.classtype,
      'age': instance.age,
    };
