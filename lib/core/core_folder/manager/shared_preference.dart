import 'dart:convert';
import 'package:injectable/injectable.dart';
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

  Future<bool> logOut(role) async {
    try {
      await sharedPreferences!.clear();
      navigate.navigateTo(
        Routes.loginScreen,
        arguments: LoginScreenArguments(userType: role),
      );
      // await locator<HiveManager>().clearAllBox();

      // getLogger('logout').d(sharedPreferences.toString());
      return true;
    } catch (e) {
      // getLogger("error clearing cache").d('logout');
      return false;
    }
  }
}
