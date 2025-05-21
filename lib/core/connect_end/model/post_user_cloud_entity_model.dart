import 'package:dio/dio.dart';

class PostUserCloudEntityModel {
  MultipartFile? file;
  String? uploadPreset;
  String? apiKey;

  PostUserCloudEntityModel({this.file, this.uploadPreset, this.apiKey});

  factory PostUserCloudEntityModel.fromJson(Map<String, dynamic> json) {
    return PostUserCloudEntityModel(
      file: json['file'],
      uploadPreset: json['upload_preset']?.toString(),
      apiKey: json['api_key']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (file != null) 'file': file,
        if (uploadPreset != null) 'upload_preset': uploadPreset,
        if (apiKey != null) 'api_key': apiKey,
      };
}
