// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_verification_cloud_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUserVerificationCloudResponse _$PostUserVerificationCloudResponseFromJson(
        Map<String, dynamic> json) =>
    PostUserVerificationCloudResponse(
      assetId: json['asset_id'] as String?,
      publicId: json['public_id'] as String?,
      version: json['version'] as num?,
      versionId: json['version_id'] as String?,
      signature: json['signature'] as String?,
      width: json['width'] as num?,
      height: json['height'] as num?,
      format: json['format'] as String?,
      resourceType: json['resource_type'] as String?,
      createdAt: json['created_at'] as String?,
      tags: json['tags'] as List<dynamic>?,
      bytes: json['bytes'] as num?,
      type: json['type'] as String?,
      etag: json['etag'] as String?,
      placeholder: json['placeholder'] as bool?,
      url: json['url'] as String?,
      secureUrl: json['secure_url'] as String?,
      assetFolder: json['asset_folder'] as String?,
      displayName: json['display_name'] as String?,
      originalFilename: json['original_filename'] as String?,
    );

Map<String, dynamic> _$PostUserVerificationCloudResponseToJson(
        PostUserVerificationCloudResponse instance) =>
    <String, dynamic>{
      'asset_id': instance.assetId,
      'public_id': instance.publicId,
      'version': instance.version,
      'version_id': instance.versionId,
      'signature': instance.signature,
      'width': instance.width,
      'height': instance.height,
      'format': instance.format,
      'resource_type': instance.resourceType,
      'created_at': instance.createdAt,
      'tags': instance.tags,
      'bytes': instance.bytes,
      'type': instance.type,
      'etag': instance.etag,
      'placeholder': instance.placeholder,
      'url': instance.url,
      'secure_url': instance.secureUrl,
      'asset_folder': instance.assetFolder,
      'display_name': instance.displayName,
      'original_filename': instance.originalFilename,
    };
