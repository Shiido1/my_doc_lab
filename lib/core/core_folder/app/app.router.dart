// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:my_doc_lab/core/connect_end/model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart'
    as _i17;
import 'package:my_doc_lab/core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart'
    as _i16;
import 'package:my_doc_lab/core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart'
    as _i19;
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/data.dart'
    as _i18;
import 'package:my_doc_lab/ui/onboarding/first_onboarding_screen.dart' as _i2;
import 'package:my_doc_lab/ui/screens/authentication/login_screen.dart' as _i7;
import 'package:my_doc_lab/ui/screens/dashboard/appointment/prescription_detail_screen.dart'
    as _i14;
import 'package:my_doc_lab/ui/screens/dashboard/chat/chat_screen.dart' as _i10;
import 'package:my_doc_lab/ui/screens/dashboard/chat/doc_chat_screen.dart'
    as _i9;
import 'package:my_doc_lab/ui/screens/dashboard/chat/pharm_chat_screen.dart'
    as _i13;
import 'package:my_doc_lab/ui/screens/dashboard/dashboard_screen.dart' as _i3;
import 'package:my_doc_lab/ui/screens/dashboard/doctor_dashboard_screen.dart'
    as _i4;
import 'package:my_doc_lab/ui/screens/dashboard/lab_dashboard_screen.dart'
    as _i5;
import 'package:my_doc_lab/ui/screens/dashboard/patient/doctor_patient_detail_sceen.dart'
    as _i11;
import 'package:my_doc_lab/ui/screens/dashboard/patient/patient_detail_sceen.dart'
    as _i12;
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy_dashboard_screen.dart'
    as _i6;
import 'package:my_doc_lab/ui/screens/dashboard/settings/profile_screen.dart'
    as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i20;

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

  static const doctorAppointmentDetailSceen =
      '/doctor-appointment-detail-sceen';

  static const patientDetailSceen = '/patient-detail-sceen';

  static const pharmChatScreen = '/pharm-chat-screen';

  static const prescriptionDetailScreen = '/prescription-detail-screen';

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
    doctorAppointmentDetailSceen,
    patientDetailSceen,
    pharmChatScreen,
    prescriptionDetailScreen,
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
    _i1.RouteDef(
      Routes.doctorAppointmentDetailSceen,
      page: _i11.DoctorAppointmentDetailSceen,
    ),
    _i1.RouteDef(
      Routes.patientDetailSceen,
      page: _i12.PatientDetailSceen,
    ),
    _i1.RouteDef(
      Routes.pharmChatScreen,
      page: _i13.PharmChatScreen,
    ),
    _i1.RouteDef(
      Routes.prescriptionDetailScreen,
      page: _i14.PrescriptionDetailScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.FirstOnboardingScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.FirstOnboardingScreen(),
        settings: data,
      );
    },
    _i3.Dashboard: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Dashboard(),
        settings: data,
      );
    },
    _i4.DocDashboard: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DocDashboard(),
        settings: data,
      );
    },
    _i5.LaboratoryDashboard: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LaboratoryDashboard(),
        settings: data,
      );
    },
    _i6.PharmacyDashboard: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.PharmacyDashboard(),
        settings: data,
      );
    },
    _i7.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.LoginScreen(key: args.key, userType: args.userType),
        settings: data,
      );
    },
    _i8.ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.ProfileScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i9.DoctorChatScreen: (data) {
      final args = data.getArgs<DoctorChatScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.DoctorChatScreen(
            key: args.key,
            id: args.id,
            messageModel: args.messageModel,
            app: args.app,
            data: args.data),
        settings: data,
      );
    },
    _i10.ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ChatScreen(
            key: args.key, id: args.id, messageModel: args.messageModel),
        settings: data,
      );
    },
    _i11.DoctorAppointmentDetailSceen: (data) {
      final args = data.getArgs<DoctorAppointmentDetailSceenArguments>(
        orElse: () => const DoctorAppointmentDetailSceenArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.DoctorAppointmentDetailSceen(
            key: args.key, appointment: args.appointment),
        settings: data,
      );
    },
    _i12.PatientDetailSceen: (data) {
      final args = data.getArgs<PatientDetailSceenArguments>(
        orElse: () => const PatientDetailSceenArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.PatientDetailSceen(
            key: args.key, order: args.order, item: args.item),
        settings: data,
      );
    },
    _i13.PharmChatScreen: (data) {
      final args = data.getArgs<PharmChatScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.PharmChatScreen(
            key: args.key,
            id: args.id,
            messageModel: args.messageModel,
            appOrder: args.appOrder),
        settings: data,
      );
    },
    _i14.PrescriptionDetailScreen: (data) {
      final args =
          data.getArgs<PrescriptionDetailScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.PrescriptionDetailScreen(key: args.key, id: args.id),
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

  final _i15.Key? key;

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

  final _i15.Key? key;

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
    required this.app,
    required this.data,
  });

  final _i15.Key? key;

  final String? id;

  final _i16.GetMessageIndexResponseModel? messageModel;

  final _i17.GetListOfDoctorsAppointmentModel? app;

  final _i18.Data? data;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "messageModel": "$messageModel", "app": "$app", "data": "$data"}';
  }

  @override
  bool operator ==(covariant DoctorChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.messageModel == messageModel &&
        other.app == app &&
        other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        id.hashCode ^
        messageModel.hashCode ^
        app.hashCode ^
        data.hashCode;
  }
}

class ChatScreenArguments {
  const ChatScreenArguments({
    this.key,
    required this.id,
    required this.messageModel,
  });

  final _i15.Key? key;

  final String? id;

  final _i16.GetMessageIndexResponseModel? messageModel;

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

class DoctorAppointmentDetailSceenArguments {
  const DoctorAppointmentDetailSceenArguments({
    this.key,
    this.appointment,
  });

  final _i15.Key? key;

  final _i17.GetListOfDoctorsAppointmentModel? appointment;

  @override
  String toString() {
    return '{"key": "$key", "appointment": "$appointment"}';
  }

  @override
  bool operator ==(covariant DoctorAppointmentDetailSceenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.appointment == appointment;
  }

  @override
  int get hashCode {
    return key.hashCode ^ appointment.hashCode;
  }
}

class PatientDetailSceenArguments {
  const PatientDetailSceenArguments({
    this.key,
    this.order,
    this.item,
  });

  final _i15.Key? key;

  final _i19.Orders? order;

  final _i19.Items? item;

  @override
  String toString() {
    return '{"key": "$key", "order": "$order", "item": "$item"}';
  }

  @override
  bool operator ==(covariant PatientDetailSceenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.order == order && other.item == item;
  }

  @override
  int get hashCode {
    return key.hashCode ^ order.hashCode ^ item.hashCode;
  }
}

class PharmChatScreenArguments {
  const PharmChatScreenArguments({
    this.key,
    required this.id,
    required this.messageModel,
    required this.appOrder,
  });

  final _i15.Key? key;

  final String? id;

  final _i16.GetMessageIndexResponseModel? messageModel;

  final _i19.Orders? appOrder;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "messageModel": "$messageModel", "appOrder": "$appOrder"}';
  }

  @override
  bool operator ==(covariant PharmChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.messageModel == messageModel &&
        other.appOrder == appOrder;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        id.hashCode ^
        messageModel.hashCode ^
        appOrder.hashCode;
  }
}

class PrescriptionDetailScreenArguments {
  const PrescriptionDetailScreenArguments({
    this.key,
    required this.id,
  });

  final _i15.Key? key;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant PrescriptionDetailScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

extension NavigatorStateExtension on _i20.NavigationService {
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
    _i15.Key? key,
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
    _i15.Key? key,
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
    _i15.Key? key,
    required String? id,
    required _i16.GetMessageIndexResponseModel? messageModel,
    required _i17.GetListOfDoctorsAppointmentModel? app,
    required _i18.Data? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.doctorChatScreen,
        arguments: DoctorChatScreenArguments(
            key: key, id: id, messageModel: messageModel, app: app, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatScreen({
    _i15.Key? key,
    required String? id,
    required _i16.GetMessageIndexResponseModel? messageModel,
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

  Future<dynamic> navigateToDoctorAppointmentDetailSceen({
    _i15.Key? key,
    _i17.GetListOfDoctorsAppointmentModel? appointment,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.doctorAppointmentDetailSceen,
        arguments: DoctorAppointmentDetailSceenArguments(
            key: key, appointment: appointment),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPatientDetailSceen({
    _i15.Key? key,
    _i19.Orders? order,
    _i19.Items? item,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.patientDetailSceen,
        arguments:
            PatientDetailSceenArguments(key: key, order: order, item: item),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPharmChatScreen({
    _i15.Key? key,
    required String? id,
    required _i16.GetMessageIndexResponseModel? messageModel,
    required _i19.Orders? appOrder,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pharmChatScreen,
        arguments: PharmChatScreenArguments(
            key: key, id: id, messageModel: messageModel, appOrder: appOrder),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrescriptionDetailScreen({
    _i15.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.prescriptionDetailScreen,
        arguments: PrescriptionDetailScreenArguments(key: key, id: id),
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
    _i15.Key? key,
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
    _i15.Key? key,
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
    _i15.Key? key,
    required String? id,
    required _i16.GetMessageIndexResponseModel? messageModel,
    required _i17.GetListOfDoctorsAppointmentModel? app,
    required _i18.Data? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.doctorChatScreen,
        arguments: DoctorChatScreenArguments(
            key: key, id: id, messageModel: messageModel, app: app, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatScreen({
    _i15.Key? key,
    required String? id,
    required _i16.GetMessageIndexResponseModel? messageModel,
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

  Future<dynamic> replaceWithDoctorAppointmentDetailSceen({
    _i15.Key? key,
    _i17.GetListOfDoctorsAppointmentModel? appointment,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.doctorAppointmentDetailSceen,
        arguments: DoctorAppointmentDetailSceenArguments(
            key: key, appointment: appointment),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPatientDetailSceen({
    _i15.Key? key,
    _i19.Orders? order,
    _i19.Items? item,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.patientDetailSceen,
        arguments:
            PatientDetailSceenArguments(key: key, order: order, item: item),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPharmChatScreen({
    _i15.Key? key,
    required String? id,
    required _i16.GetMessageIndexResponseModel? messageModel,
    required _i19.Orders? appOrder,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.pharmChatScreen,
        arguments: PharmChatScreenArguments(
            key: key, id: id, messageModel: messageModel, appOrder: appOrder),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPrescriptionDetailScreen({
    _i15.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.prescriptionDetailScreen,
        arguments: PrescriptionDetailScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
