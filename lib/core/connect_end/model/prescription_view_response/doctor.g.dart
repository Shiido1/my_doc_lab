// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  id: json['id'] as num?,
  uuid: json['uuid'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  gender: json['gender'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  about: json['about'],
  speciality: json['speciality'] as String?,
  status: json['status'] as String?,
  emailVerifiedAt:
      json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
  certifications: json['certifications'],
  experience: json['experience'],
  profileImage: json['profile_image'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  address: json['address'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'uuid': instance.uuid,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'gender': instance.gender,
  'email': instance.email,
  'phone': instance.phone,
  'about': instance.about,
  'speciality': instance.speciality,
  'status': instance.status,
  'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
  'certifications': instance.certifications,
  'experience': instance.experience,
  'profile_image': instance.profileImage,
  'city': instance.city,
  'state': instance.state,
  'address': instance.address,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
};
