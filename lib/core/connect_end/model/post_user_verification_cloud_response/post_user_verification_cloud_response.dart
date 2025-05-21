import 'package:json_annotation/json_annotation.dart';

part 'post_user_verification_cloud_response.g.dart';

@JsonSerializable()
class PostUserVerificationCloudResponse {
  @JsonKey(name: 'asset_id')
  String? assetId;
  @JsonKey(name: 'public_id')
  String? publicId;
  num? version;
  @JsonKey(name: 'version_id')
  String? versionId;
  String? signature;
  num? width;
  num? height;
  String? format;
  @JsonKey(name: 'resource_type')
  String? resourceType;
  @JsonKey(name: 'created_at')
  String? createdAt;
  List<dynamic>? tags;
  num? bytes;
  String? type;
  String? etag;
  bool? placeholder;
  String? url;
  @JsonKey(name: 'secure_url')
  String? secureUrl;
  @JsonKey(name: 'asset_folder')
  String? assetFolder;
  @JsonKey(name: 'display_name')
  String? displayName;
  @JsonKey(name: 'original_filename')
  String? originalFilename;

  PostUserVerificationCloudResponse({
    this.assetId,
    this.publicId,
    this.version,
    this.versionId,
    this.signature,
    this.width,
    this.height,
    this.format,
    this.resourceType,
    this.createdAt,
    this.tags,
    this.bytes,
    this.type,
    this.etag,
    this.placeholder,
    this.url,
    this.secureUrl,
    this.assetFolder,
    this.displayName,
    this.originalFilename,
  });

  factory PostUserVerificationCloudResponse.fromJson(
      Map<String, dynamic> json) {
    return _$PostUserVerificationCloudResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostUserVerificationCloudResponseToJson(this);
  }
}
