// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

/// Helper class for converting [DioError] into readable formats
class ApiError {
  int? errorType = 0;
  ApiErrorModel? apiErrorModel;

  // final logger = getLogger('ApiError');

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      // logger.d(dioError.response?.data);
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to server was cancelled";
          break;
        case DioErrorType.connectionTimeout:
          errorDescription =
              "Connection timeout with server, please try again later";
          break;
        case DioErrorType.unknown:
          errorDescription =
              "Connection to server failed due to internet connection, please check and try again";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription =
              "Receive timeout in connection with server, please try again later.";
          break;
        case DioErrorType.badResponse:
          errorType = dioError.response?.statusCode;
          if (dioError.response?.statusCode == 401) {
            apiErrorModel = ApiErrorModel.fromJson(dioError.response?.data);
            errorDescription = apiErrorModel?.msg ??
                extractDescriptionFromResponse(error.response);
          } else if (dioError.response?.statusCode == 400 ||
              dioError.response?.statusCode == 422 ||
              dioError.response?.statusCode == 405 ||
              dioError.response?.statusCode == 403 ||
              dioError.response?.statusCode == 404 ||
              dioError.response?.statusCode == 409) {
            apiErrorModel = ApiErrorModel.fromJson(dioError.response?.data);
            print('..u... ${apiErrorModel?.data}');
            if (apiErrorModel?.error != null) {
              if (apiErrorModel?.error['code'] != null) {
                errorDescription = apiErrorModel?.error['code'][0];
              } else if (apiErrorModel?.error['email'] != null) {
                errorDescription = apiErrorModel?.error['email'][0];
              } else if (apiErrorModel?.error['username'] != null) {
                errorDescription = apiErrorModel?.error['username'][0];
              } else if (apiErrorModel?.error['business_logo'] != null) {
                errorDescription = apiErrorModel?.error['business_logo'][0];
              } else if (apiErrorModel?.error['description'] != null) {
                errorDescription = apiErrorModel?.error['description'][0];
              } else if (apiErrorModel?.error['referral_code'] != null) {
                errorDescription = apiErrorModel?.error['referral_code'][0];
              } else if (apiErrorModel?.error['discount'] != null) {
                errorDescription = apiErrorModel?.error['discount'][0];
              } else if (apiErrorModel?.error['checked_in'] != null) {
                errorDescription = apiErrorModel?.error['checked_in'][0];
              } else if (apiErrorModel?.error['data'] != null) {
                errorDescription = apiErrorModel?.error['data'];
              }
            } else {
              errorDescription = apiErrorModel?.msg ??
                  apiErrorModel?.data ??
                  extractDescriptionFromResponse(error.response);
            }
          } else if (dioError.response?.statusCode == 500) {
            errorDescription =
                'Something went wrong while processing your request';
          } else {
            errorDescription =
                "Oops! we couldn't make connections, please try again";
          }
          break;
        case DioErrorType.sendTimeout:
          errorDescription =
              "Connection to server failed due to internet connection, please check and try again";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad certificate";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection error";
      }
    } else {
      errorDescription = "Oops an error occurred, we are fixing it";
    }
  }

  String extractDescriptionFromResponse(Response<dynamic>? response) {
    String message = "";
    try {
      if (response?.data != null && response?.data["message"] != null) {
        message =
            response?.data["message"] ?? response?.data['errors']['email'][0];
      } else {
        message = response?.statusMessage ?? '';
      }
    } catch (error) {
      message = response?.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}

class ApiErrorModel {
  String? code;
  String? msg;
  String? data;
  bool? success;
  String? details;
  dynamic error;

  ApiErrorModel(
      {this.code, this.msg, this.success, this.details, this.error, this.data});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
      code: json["code"],
      msg: json["msg"] ?? json["message"],
      success: json["success"],
      details: json["details"],
      error: json["errors"],
      data: json["data"]);
}
