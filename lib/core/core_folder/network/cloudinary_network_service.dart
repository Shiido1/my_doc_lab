import 'package:dio/dio.dart';
import '../app/app.locator.dart';
import '../config/configuration.dart';
import '../manager/shared_preference.dart';
import 'api_error.dart';

import 'app_interceptors.dart';

/// description: A network provider class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handle, token management, logging, global
void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

/// A top level function to print dio logs
void printDioLogs(Object object) {
  printWrapped(object.toString());
}

// @lazySingleton
class CloudinaryNetworkService {
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  Dio? dio;
  String? baseUrl, authToken;

  final session = locator<SharedPreferencesService>();

  CloudinaryNetworkService({String? baseUrl, String? authToken}) {
    // ignore: prefer_initializing_formals
    this.baseUrl = baseUrl;
    // ignore: prefer_initializing_formals
    this.authToken = authToken;
    _initialiseDio();
  }

  // Initialize essential class properties
  void _initialiseDio() {
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      baseUrl: baseUrl ?? AppConfig.cloudinaryUrl,
    ));
    // authToken ??= session.authToken;
    dio!.interceptors
      ..add(AppInterceptor(authToken ?? ''))
      ..add(LogInterceptor(requestBody: true, logPrint: printDioLogs));
  }

  /// Factory constructor used mainly for injecting an instance of [Dio] mock
  CloudinaryNetworkService.test(this.dio);

  Future<Response> call(
    String path,
    CloudRequestMethod method, {
    Map<String, dynamic>? queryParams,
    data,
    FormData? formData,
    ResponseType responseType = ResponseType.json,
    Options? options,
    classTag = '',
  }) async {
    // _initialiseDio();
    Response response;
    var params = queryParams ?? {};
    if (params.keys.contains("searchTerm")) {
      params["searchTerm"] = Uri.encodeQueryComponent(params["searchTerm"]);
    }
    try {
      switch (method) {
        case CloudRequestMethod.post:
          response = await dio!.post(
            path,
            queryParameters: params,
            data: data,
            // options: options ?? await _getOption()
          );
          break;
        case CloudRequestMethod.get:
          response = await dio!.get(
            path,
            // queryParameters: data, options: options ?? await _getOption()
          );
          break;
        case CloudRequestMethod.getParams:
          response = await dio!.get(
            path,
            // queryParameters: params, options: options ?? await _getOption()
          );

          break;
        case CloudRequestMethod.put:
          response = await dio!.put(
            path,
            queryParameters: params,
            data: data,
            // options: options ?? await _getOption()
          );
          break;
        case CloudRequestMethod.delete:
          response = await dio!.delete(
            path,
            queryParameters: params,
            data: data,
            // options: options ?? await _getOption()
          );
          break;
        case CloudRequestMethod.upload:
          response = await dio!.post(path,
              data: data,
              queryParameters: params,
              options: options ??
                  Options(headers: {
                    // "Authorization": "Bearer ${session.authToken}",
                    "Content-Disposition": "form-data",
                    "Content-Type": "multipart/form-data",
                    'Accept': 'application/json'
                  }), onSendProgress: (sent, total) {
            // eventBus
            //     .fire(
            //     FileUploadProgressEvent(FileUploadProgress(sent, total, tag: classTag)));
          });
          break;
      }
      return response;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // eventBus.fire(LogoutEvent("just log out out of here pls"));
        print('error plate ${error.toString()}');
      }
      return Future.error(apiError, stackTrace);
    }
  }

  // Future<Options> _getOption() async {
  //   return Options(headers: {
  //     "Authorization": "Bearer ${session.authToken}",
  //     'Accept': 'application/json',
  //   });
  // }
}

enum CloudRequestMethod { post, get, put, delete, upload, getParams }
