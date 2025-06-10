import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../app/app.router.dart';

@lazySingleton
class SharedPreferencesService {
  SharedPreferencesService._internal();

  SharedPreferences? sharedPreferences;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  static SharedPreferencesService get instance => _instance;

  Future<void> initilize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String logginKey = 'loggin';
  static const String verified = 'verify';
  static const String kycVerified = 'kyc_verify';
  // ignore: constant_identifier_names
  static const String is_first_login = 'is_first_login';
  static const String notifiedKey = 'notify';
  static const String userData = 'user';
  static const String chatData = 'chat';
  static const String processData = 'process';
  static const String cancelData = 'cancel';
  static const String completeData = 'complete';

  String get authToken => sharedPreferences?.getString(keyAuthToken) ?? '';

  bool get isNotified => sharedPreferences?.getBool(notifiedKey) ?? false;
  bool get isLoggedIn => sharedPreferences?.getBool(logginKey) ?? false;
  bool get isFirstLogin => sharedPreferences?.getBool(is_first_login) ?? false;
  bool get isVerified => sharedPreferences?.getBool(verified) ?? false;
  bool get isKycVerified => sharedPreferences?.getBool(kycVerified) ?? false;
  Map<String, dynamic> get usersData {
    final userDataString = sharedPreferences?.getString(userData);
    if (userDataString != null && userDataString.isNotEmpty) {
      return json.decode(userDataString);
    }
    return {};
  }

  Map<String, dynamic> get chatsData {
    final chatDataString = sharedPreferences?.getString(chatData);
    if (chatDataString != null && chatDataString.isNotEmpty) {
      return json.decode(chatDataString);
    }
    return {};
  }

  Map<String, List<Items>> get processedData {
    final processedDataString = sharedPreferences?.getString(processData);
    if (processedDataString != null && processedDataString.isNotEmpty) {
      Map<String, List<Items>> itemsMap = convertToItemsMap(
        processedDataString,
      );
      return itemsMap;
    }
    return {};
  }

  Map<String, List<Items>> get completedData {
    final completedDataString = sharedPreferences?.getString(completeData);
    if (completedDataString != null && completedDataString.isNotEmpty) {
      Map<String, List<Items>> itemsMap = convertToItemsMap(
        completedDataString,
      );
      return itemsMap;
    }
    return {};
  }

  Map<String, List<Items>> get cancelledData {
    final cancelDataDataString = sharedPreferences?.getString(cancelData);
    if (cancelDataDataString != null && cancelDataDataString.isNotEmpty) {
      Map<String, List<Items>> itemsMap = convertToItemsMap(
        cancelDataDataString,
      );
      return itemsMap;
    }
    return {};
  }

  Map<String, List<Items>> convertToItemsMap(String jsonString) {
    final Map<String, dynamic> rawMap = jsonDecode(jsonString);

    return rawMap.map((key, value) {
      return MapEntry(
        key,
        List<Items>.from(value.map((item) => Items.fromJson(item))),
      );
    });
  }

  set isLoggedIn(bool logging) =>
      sharedPreferences?.setBool(logginKey, logging);
  set isFirstLogin(bool isLog) =>
      sharedPreferences?.setBool(is_first_login, isLog);
  set isVerified(bool verify) => sharedPreferences?.setBool(verified, verify);
  set isKycVerified(bool verifyKyc) =>
      sharedPreferences?.setBool(kycVerified, verifyKyc);
  set isNotified(bool notify) =>
      sharedPreferences?.setBool(notifiedKey, notify);
  set authToken(String authToken) =>
      sharedPreferences?.setString(keyAuthToken, authToken);

  set usersData(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userData, json.encode(map));

  set chatsData(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(chatData, json.encode(map));
  set completedData(Map<String, List<Items>>? map) =>
      sharedPreferences?.setString(completeData, json.encode(map));
  set cancelledData(Map<String, List<Items>>? map) =>
      sharedPreferences?.setString(cancelData, json.encode(map));
  set processedData(Map<String, List<Items>>? map) =>
      sharedPreferences?.setString(processData, json.encode(map));

  Future<bool> logOut(role) async {
    try {
      await sharedPreferences!.clear();
      navigate.clearStackAndShow(
        Routes.loginScreen,
        arguments: LoginScreenArguments(userType: role),
      );
      await box.clear();

      // getLogger('logout').d(sharedPreferences.toString());
      return true;
    } catch (e) {
      // getLogger("error clearing cache").d('logout');
      return false;
    }
  }
}
