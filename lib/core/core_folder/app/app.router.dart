// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:my_doc_lab/core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart'
    as _i12;
import 'package:my_doc_lab/ui/onboarding/first_onboarding_screen.dart' as _i2;
import 'package:my_doc_lab/ui/screens/authentication/login_screen.dart' as _i7;
import 'package:my_doc_lab/ui/screens/dashboard/chat/chat_screen.dart' as _i10;
import 'package:my_doc_lab/ui/screens/dashboard/chat/doc_chat_screen.dart'
    as _i9;
import 'package:my_doc_lab/ui/screens/dashboard/dashboard_screen.dart' as _i3;
import 'package:my_doc_lab/ui/screens/dashboard/doctor_dashboard_screen.dart'
    as _i4;
import 'package:my_doc_lab/ui/screens/dashboard/lab_dashboard_screen.dart'
    as _i5;
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy_dashboard_screen.dart'
    as _i6;
import 'package:my_doc_lab/ui/screens/dashboard/settings/profile_screen.dart'
    as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const firstOnboardingScreen = '/';

  static const dashboard = '/Dashboard';

  static const docDashboard = '/doc-dashboard';

  static const laboratoryDashboard = '/laboratory-dashboard';

  static const pharmacyDashboard = '/pharmacy-dashboard';

  static const loginScreen = '/login-screen';

  static const profileScreen = '/profile-screen';

  static const doctorChatScreen = '/doctor-chat-screen';

  static const chatScreen = '/chat-screen';

  static const all = <String>{
    firstOnboardingScreen,
    dashboard,
    docDashboard,
    laboratoryDashboard,
    pharmacyDashboard,
    loginScreen,
    profileScreen,
    doctorChatScreen,
    chatScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.firstOnboardingScreen,
      page: _i2.FirstOnboardingScreen,
    ),
    _i1.RouteDef(
      Routes.dashboard,
      page: _i3.Dashboard,
    ),
    _i1.RouteDef(
      Routes.docDashboard,
      page: _i4.DocDashboard,
    ),
    _i1.RouteDef(
      Routes.laboratoryDashboard,
      page: _i5.LaboratoryDashboard,
    ),
    _i1.RouteDef(
      Routes.pharmacyDashboard,
      page: _i6.PharmacyDashboard,
    ),
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i7.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.profileScreen,
      page: _i8.ProfileScreen,
    ),
    _i1.RouteDef(
      Routes.doctorChatScreen,
      page: _i9.DoctorChatScreen,
    ),
    _i1.RouteDef(
      Routes.chatScreen,
      page: _i10.ChatScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.FirstOnboardingScreen: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.FirstOnboardingScreen(),
        settings: data,
      );
    },
    _i3.Dashboard: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Dashboard(),
        settings: data,
      );
    },
    _i4.DocDashboard: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DocDashboard(),
        settings: data,
      );
    },
    _i5.LaboratoryDashboard: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LaboratoryDashboard(),
        settings: data,
      );
    },
    _i6.PharmacyDashboard: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.PharmacyDashboard(),
        settings: data,
      );
    },
    _i7.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.LoginScreen(key: args.key, userType: args.userType),
        settings: data,
      );
    },
    _i8.ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.ProfileScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i9.DoctorChatScreen: (data) {
      final args = data.getArgs<DoctorChatScreenArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.DoctorChatScreen(
            key: args.key, id: args.id, messageModel: args.messageModel),
        settings: data,
      );
    },
    _i10.ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ChatScreen(
            key: args.key, id: args.id, messageModel: args.messageModel),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginScreenArguments {
  const LoginScreenArguments({
    this.key,
    required this.userType,
  });

  final _i11.Key? key;

  final String? userType;

  @override
  String toString() {
    return '{"key": "$key", "userType": "$userType"}';
  }

  @override
  bool operator ==(covariant LoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userType == userType;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userType.hashCode;
  }
}

class ProfileScreenArguments {
  const ProfileScreenArguments({
    this.key,
    required this.id,
  });

  final _i11.Key? key;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant ProfileScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class DoctorChatScreenArguments {
  const DoctorChatScreenArguments({
    this.key,
    required this.id,
    required this.messageModel,
  });

  final _i11.Key? key;

  final String? id;

  final _i12.GetMessageIndexResponseModel? messageModel;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "messageModel": "$messageModel"}';
  }

  @override
  bool operator ==(covariant DoctorChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.messageModel == messageModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ messageModel.hashCode;
  }
}

class ChatScreenArguments {
  const ChatScreenArguments({
    this.key,
    required this.id,
    required this.messageModel,
  });

  final _i11.Key? key;

  final String? id;

  final _i12.GetMessageIndexResponseModel? messageModel;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "messageModel": "$messageModel"}';
  }

  @override
  bool operator ==(covariant ChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.messageModel == messageModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ messageModel.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToFirstOnboardingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.firstOnboardingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDocDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.docDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLaboratoryDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.laboratoryDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPharmacyDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pharmacyDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreen({
    _i11.Key? key,
    required String? userType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        arguments: LoginScreenArguments(key: key, userType: userType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileScreen({
    _i11.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.profileScreen,
        arguments: ProfileScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDoctorChatScreen({
    _i11.Key? key,
    required String? id,
    required _i12.GetMessageIndexResponseModel? messageModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.doctorChatScreen,
        arguments: DoctorChatScreenArguments(
            key: key, id: id, messageModel: messageModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatScreen({
    _i11.Key? key,
    required String? id,
    required _i12.GetMessageIndexResponseModel? messageModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatScreen,
        arguments:
            ChatScreenArguments(key: key, id: id, messageModel: messageModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFirstOnboardingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.firstOnboardingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDocDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.docDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLaboratoryDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.laboratoryDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPharmacyDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pharmacyDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen({
    _i11.Key? key,
    required String? userType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        arguments: LoginScreenArguments(key: key, userType: userType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileScreen({
    _i11.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.profileScreen,
        arguments: ProfileScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDoctorChatScreen({
    _i11.Key? key,
    required String? id,
    required _i12.GetMessageIndexResponseModel? messageModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.doctorChatScreen,
        arguments: DoctorChatScreenArguments(
            key: key, id: id, messageModel: messageModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatScreen({
    _i11.Key? key,
    required String? id,
    required _i12.GetMessageIndexResponseModel? messageModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatScreen,
        arguments:
            ChatScreenArguments(key: key, id: id, messageModel: messageModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
