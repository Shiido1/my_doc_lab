// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i22;
import 'package:flutter/material.dart';
import 'package:my_doc_lab/core/connect_end/model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart'
    as _i24;
import 'package:my_doc_lab/core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart'
    as _i23;
import 'package:my_doc_lab/core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart'
    as _i27;
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/data.dart'
    as _i25;
import 'package:my_doc_lab/core/connect_end/model/get_users_appointment_model/get_users_appointment_model.dart'
    as _i26;
import 'package:my_doc_lab/core/connect_end/model/view_doctors_prescription_model/view_doctors_prescription_model.dart'
    as _i28;
import 'package:my_doc_lab/ui/onboarding/first_onboarding_screen.dart' as _i2;
import 'package:my_doc_lab/ui/screens/authentication/login_screen.dart' as _i7;
import 'package:my_doc_lab/ui/screens/authentication/verification_screen_forgot_password.dart'
    as _i18;
import 'package:my_doc_lab/ui/screens/dashboard/appointment/prescription_detail_screen.dart'
    as _i16;
import 'package:my_doc_lab/ui/screens/dashboard/chat/chat_screen.dart' as _i10;
import 'package:my_doc_lab/ui/screens/dashboard/chat/doc_chat_screen.dart'
    as _i9;
import 'package:my_doc_lab/ui/screens/dashboard/chat/pharm_chat_screen.dart'
    as _i15;
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/doc_vid_call_look_screen.dart'
    as _i19;
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/doctor_video_chat_screen.dart'
    as _i11;
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/join_doctor_video_chat_screen.dart'
    as _i21;
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/join_video_chat_screen.dart'
    as _i20;
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/video_chat_screen.dart'
    as _i12;
import 'package:my_doc_lab/ui/screens/dashboard/dashboard_screen.dart' as _i3;
import 'package:my_doc_lab/ui/screens/dashboard/doctor_dashboard_screen.dart'
    as _i4;
import 'package:my_doc_lab/ui/screens/dashboard/lab_dashboard_screen.dart'
    as _i5;
import 'package:my_doc_lab/ui/screens/dashboard/patient/doctor_patient_detail_sceen.dart'
    as _i13;
import 'package:my_doc_lab/ui/screens/dashboard/patient/patient_detail_sceen.dart'
    as _i14;
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy_dashboard_screen.dart'
    as _i6;
import 'package:my_doc_lab/ui/screens/dashboard/settings/profile_screen.dart'
    as _i8;
import 'package:my_doc_lab/ui/screens/dashboard/settings/user_prescription/user_prescription_detail_screen.dart'
    as _i17;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i29;

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

  static const doctorVideoChatScreen = '/doctor-video-chat-screen';

  static const videoChatScreen = '/video-chat-screen';

  static const doctorAppointmentDetailSceen =
      '/doctor-appointment-detail-sceen';

  static const patientDetailSceen = '/patient-detail-sceen';

  static const pharmChatScreen = '/pharm-chat-screen';

  static const prescriptionDetailScreen = '/prescription-detail-screen';

  static const userPrescriptionDetailScreen =
      '/user-prescription-detail-screen';

  static const verificationScreenForgotPassword =
      '/verification-screen-forgot-password';

  static const docVidCallLookScreen = '/doc-vid-call-look-screen';

  static const joinVideoChatScreen = '/join-video-chat-screen';

  static const joinDoctorVideoChatScreen = '/join-doctor-video-chat-screen';

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
    doctorVideoChatScreen,
    videoChatScreen,
    doctorAppointmentDetailSceen,
    patientDetailSceen,
    pharmChatScreen,
    prescriptionDetailScreen,
    userPrescriptionDetailScreen,
    verificationScreenForgotPassword,
    docVidCallLookScreen,
    joinVideoChatScreen,
    joinDoctorVideoChatScreen,
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
      Routes.doctorVideoChatScreen,
      page: _i11.DoctorVideoChatScreen,
    ),
    _i1.RouteDef(
      Routes.videoChatScreen,
      page: _i12.VideoChatScreen,
    ),
    _i1.RouteDef(
      Routes.doctorAppointmentDetailSceen,
      page: _i13.DoctorAppointmentDetailSceen,
    ),
    _i1.RouteDef(
      Routes.patientDetailSceen,
      page: _i14.PatientDetailSceen,
    ),
    _i1.RouteDef(
      Routes.pharmChatScreen,
      page: _i15.PharmChatScreen,
    ),
    _i1.RouteDef(
      Routes.prescriptionDetailScreen,
      page: _i16.PrescriptionDetailScreen,
    ),
    _i1.RouteDef(
      Routes.userPrescriptionDetailScreen,
      page: _i17.UserPrescriptionDetailScreen,
    ),
    _i1.RouteDef(
      Routes.verificationScreenForgotPassword,
      page: _i18.VerificationScreenForgotPassword,
    ),
    _i1.RouteDef(
      Routes.docVidCallLookScreen,
      page: _i19.DocVidCallLookScreen,
    ),
    _i1.RouteDef(
      Routes.joinVideoChatScreen,
      page: _i20.JoinVideoChatScreen,
    ),
    _i1.RouteDef(
      Routes.joinDoctorVideoChatScreen,
      page: _i21.JoinDoctorVideoChatScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.FirstOnboardingScreen: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.FirstOnboardingScreen(),
        settings: data,
      );
    },
    _i3.Dashboard: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Dashboard(),
        settings: data,
      );
    },
    _i4.DocDashboard: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DocDashboard(),
        settings: data,
      );
    },
    _i5.LaboratoryDashboard: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LaboratoryDashboard(),
        settings: data,
      );
    },
    _i6.PharmacyDashboard: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.PharmacyDashboard(),
        settings: data,
      );
    },
    _i7.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.LoginScreen(key: args.key, userType: args.userType),
        settings: data,
      );
    },
    _i8.ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.ProfileScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i9.DoctorChatScreen: (data) {
      final args = data.getArgs<DoctorChatScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.DoctorChatScreen(
            key: args.key,
            id: args.id,
            messageModel: args.messageModel,
            app: args.app,
            data: args.data,
            sender: args.sender),
        settings: data,
      );
    },
    _i10.ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ChatScreen(
            key: args.key,
            id: args.id,
            messageModel: args.messageModel,
            sender: args.sender,
            getUsersAppointmentModel: args.getUsersAppointmentModel),
        settings: data,
      );
    },
    _i11.DoctorVideoChatScreen: (data) {
      final args = data.getArgs<DoctorVideoChatScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.DoctorVideoChatScreen(
            key: args.key,
            conversationId: args.conversationId,
            receiverId: args.receiverId,
            receiverType: args.receiverType),
        settings: data,
      );
    },
    _i12.VideoChatScreen: (data) {
      final args = data.getArgs<VideoChatScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.VideoChatScreen(
            key: args.key,
            conversationId: args.conversationId,
            receiverId: args.receiverId,
            receiverType: args.receiverType),
        settings: data,
      );
    },
    _i13.DoctorAppointmentDetailSceen: (data) {
      final args = data.getArgs<DoctorAppointmentDetailSceenArguments>(
        orElse: () => const DoctorAppointmentDetailSceenArguments(),
      );
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.DoctorAppointmentDetailSceen(
            key: args.key, appointment: args.appointment),
        settings: data,
      );
    },
    _i14.PatientDetailSceen: (data) {
      final args = data.getArgs<PatientDetailSceenArguments>(
        orElse: () => const PatientDetailSceenArguments(),
      );
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.PatientDetailSceen(
            key: args.key, order: args.order, item: args.item),
        settings: data,
      );
    },
    _i15.PharmChatScreen: (data) {
      final args = data.getArgs<PharmChatScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.PharmChatScreen(
            key: args.key,
            id: args.id,
            messageModel: args.messageModel,
            appOrder: args.appOrder),
        settings: data,
      );
    },
    _i16.PrescriptionDetailScreen: (data) {
      final args =
          data.getArgs<PrescriptionDetailScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i16.PrescriptionDetailScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i17.UserPrescriptionDetailScreen: (data) {
      final args =
          data.getArgs<UserPrescriptionDetailScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i17.UserPrescriptionDetailScreen(key: args.key, view: args.view),
        settings: data,
      );
    },
    _i18.VerificationScreenForgotPassword: (data) {
      final args = data.getArgs<VerificationScreenForgotPasswordArguments>(
          nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.VerificationScreenForgotPassword(
            key: args.key, email: args.email, userType: args.userType),
        settings: data,
      );
    },
    _i19.DocVidCallLookScreen: (data) {
      final args = data.getArgs<DocVidCallLookScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.DocVidCallLookScreen(
            key: args.key,
            image: args.image,
            callId: args.callId,
            conversationId: args.conversationId,
            messageModel: args.messageModel,
            sender: args.sender),
        settings: data,
      );
    },
    _i20.JoinVideoChatScreen: (data) {
      final args = data.getArgs<JoinVideoChatScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.JoinVideoChatScreen(
            key: args.key, agoravalue: args.agoravalue),
        settings: data,
      );
    },
    _i21.JoinDoctorVideoChatScreen: (data) {
      final args =
          data.getArgs<JoinDoctorVideoChatScreenArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.JoinDoctorVideoChatScreen(
            key: args.key, agoravalue: args.agoravalue),
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

  final _i22.Key? key;

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

  final _i22.Key? key;

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
    required this.sender,
  });

  final _i22.Key? key;

  final String? id;

  final _i23.GetMessageIndexResponseModel? messageModel;

  final _i24.GetListOfDoctorsAppointmentModel? app;

  final _i25.Data? data;

  final dynamic sender;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "messageModel": "$messageModel", "app": "$app", "data": "$data", "sender": "$sender"}';
  }

  @override
  bool operator ==(covariant DoctorChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.messageModel == messageModel &&
        other.app == app &&
        other.data == data &&
        other.sender == sender;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        id.hashCode ^
        messageModel.hashCode ^
        app.hashCode ^
        data.hashCode ^
        sender.hashCode;
  }
}

class ChatScreenArguments {
  const ChatScreenArguments({
    this.key,
    required this.id,
    required this.messageModel,
    required this.sender,
    this.getUsersAppointmentModel,
  });

  final _i22.Key? key;

  final String? id;

  final _i23.GetMessageIndexResponseModel? messageModel;

  final dynamic sender;

  final _i26.GetUsersAppointmentModel? getUsersAppointmentModel;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "messageModel": "$messageModel", "sender": "$sender", "getUsersAppointmentModel": "$getUsersAppointmentModel"}';
  }

  @override
  bool operator ==(covariant ChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.messageModel == messageModel &&
        other.sender == sender &&
        other.getUsersAppointmentModel == getUsersAppointmentModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        id.hashCode ^
        messageModel.hashCode ^
        sender.hashCode ^
        getUsersAppointmentModel.hashCode;
  }
}

class DoctorVideoChatScreenArguments {
  const DoctorVideoChatScreenArguments({
    this.key,
    required this.conversationId,
    required this.receiverId,
    required this.receiverType,
  });

  final _i22.Key? key;

  final int? conversationId;

  final int? receiverId;

  final String? receiverType;

  @override
  String toString() {
    return '{"key": "$key", "conversationId": "$conversationId", "receiverId": "$receiverId", "receiverType": "$receiverType"}';
  }

  @override
  bool operator ==(covariant DoctorVideoChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.conversationId == conversationId &&
        other.receiverId == receiverId &&
        other.receiverType == receiverType;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        conversationId.hashCode ^
        receiverId.hashCode ^
        receiverType.hashCode;
  }
}

class VideoChatScreenArguments {
  const VideoChatScreenArguments({
    this.key,
    required this.conversationId,
    required this.receiverId,
    required this.receiverType,
  });

  final _i22.Key? key;

  final int? conversationId;

  final int? receiverId;

  final String? receiverType;

  @override
  String toString() {
    return '{"key": "$key", "conversationId": "$conversationId", "receiverId": "$receiverId", "receiverType": "$receiverType"}';
  }

  @override
  bool operator ==(covariant VideoChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.conversationId == conversationId &&
        other.receiverId == receiverId &&
        other.receiverType == receiverType;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        conversationId.hashCode ^
        receiverId.hashCode ^
        receiverType.hashCode;
  }
}

class DoctorAppointmentDetailSceenArguments {
  const DoctorAppointmentDetailSceenArguments({
    this.key,
    this.appointment,
  });

  final _i22.Key? key;

  final _i24.GetListOfDoctorsAppointmentModel? appointment;

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

  final _i22.Key? key;

  final _i27.Orders? order;

  final _i27.Items? item;

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

  final _i22.Key? key;

  final String? id;

  final _i23.GetMessageIndexResponseModel? messageModel;

  final _i27.Orders? appOrder;

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

  final _i22.Key? key;

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

class UserPrescriptionDetailScreenArguments {
  const UserPrescriptionDetailScreenArguments({
    this.key,
    required this.view,
  });

  final _i22.Key? key;

  final _i28.ViewDoctorsPrescriptionModel? view;

  @override
  String toString() {
    return '{"key": "$key", "view": "$view"}';
  }

  @override
  bool operator ==(covariant UserPrescriptionDetailScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.view == view;
  }

  @override
  int get hashCode {
    return key.hashCode ^ view.hashCode;
  }
}

class VerificationScreenForgotPasswordArguments {
  const VerificationScreenForgotPasswordArguments({
    this.key,
    required this.email,
    required this.userType,
  });

  final _i22.Key? key;

  final String? email;

  final String? userType;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email", "userType": "$userType"}';
  }

  @override
  bool operator ==(covariant VerificationScreenForgotPasswordArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.email == email &&
        other.userType == userType;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode ^ userType.hashCode;
  }
}

class DocVidCallLookScreenArguments {
  const DocVidCallLookScreenArguments({
    this.key,
    required this.image,
    required this.callId,
    required this.conversationId,
    required this.messageModel,
    required this.sender,
  });

  final _i22.Key? key;

  final String? image;

  final String? callId;

  final String? conversationId;

  final _i23.GetMessageIndexResponseModel? messageModel;

  final dynamic sender;

  @override
  String toString() {
    return '{"key": "$key", "image": "$image", "callId": "$callId", "conversationId": "$conversationId", "messageModel": "$messageModel", "sender": "$sender"}';
  }

  @override
  bool operator ==(covariant DocVidCallLookScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.image == image &&
        other.callId == callId &&
        other.conversationId == conversationId &&
        other.messageModel == messageModel &&
        other.sender == sender;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        image.hashCode ^
        callId.hashCode ^
        conversationId.hashCode ^
        messageModel.hashCode ^
        sender.hashCode;
  }
}

class JoinVideoChatScreenArguments {
  const JoinVideoChatScreenArguments({
    this.key,
    required this.agoravalue,
  });

  final _i22.Key? key;

  final dynamic agoravalue;

  @override
  String toString() {
    return '{"key": "$key", "agoravalue": "$agoravalue"}';
  }

  @override
  bool operator ==(covariant JoinVideoChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.agoravalue == agoravalue;
  }

  @override
  int get hashCode {
    return key.hashCode ^ agoravalue.hashCode;
  }
}

class JoinDoctorVideoChatScreenArguments {
  const JoinDoctorVideoChatScreenArguments({
    this.key,
    required this.agoravalue,
  });

  final _i22.Key? key;

  final dynamic agoravalue;

  @override
  String toString() {
    return '{"key": "$key", "agoravalue": "$agoravalue"}';
  }

  @override
  bool operator ==(covariant JoinDoctorVideoChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.agoravalue == agoravalue;
  }

  @override
  int get hashCode {
    return key.hashCode ^ agoravalue.hashCode;
  }
}

extension NavigatorStateExtension on _i29.NavigationService {
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
    _i22.Key? key,
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
    _i22.Key? key,
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
    _i22.Key? key,
    required String? id,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required _i24.GetListOfDoctorsAppointmentModel? app,
    required _i25.Data? data,
    required dynamic sender,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.doctorChatScreen,
        arguments: DoctorChatScreenArguments(
            key: key,
            id: id,
            messageModel: messageModel,
            app: app,
            data: data,
            sender: sender),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatScreen({
    _i22.Key? key,
    required String? id,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required dynamic sender,
    _i26.GetUsersAppointmentModel? getUsersAppointmentModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatScreen,
        arguments: ChatScreenArguments(
            key: key,
            id: id,
            messageModel: messageModel,
            sender: sender,
            getUsersAppointmentModel: getUsersAppointmentModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDoctorVideoChatScreen({
    _i22.Key? key,
    required int? conversationId,
    required int? receiverId,
    required String? receiverType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.doctorVideoChatScreen,
        arguments: DoctorVideoChatScreenArguments(
            key: key,
            conversationId: conversationId,
            receiverId: receiverId,
            receiverType: receiverType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVideoChatScreen({
    _i22.Key? key,
    required int? conversationId,
    required int? receiverId,
    required String? receiverType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.videoChatScreen,
        arguments: VideoChatScreenArguments(
            key: key,
            conversationId: conversationId,
            receiverId: receiverId,
            receiverType: receiverType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDoctorAppointmentDetailSceen({
    _i22.Key? key,
    _i24.GetListOfDoctorsAppointmentModel? appointment,
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
    _i22.Key? key,
    _i27.Orders? order,
    _i27.Items? item,
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
    _i22.Key? key,
    required String? id,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required _i27.Orders? appOrder,
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
    _i22.Key? key,
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

  Future<dynamic> navigateToUserPrescriptionDetailScreen({
    _i22.Key? key,
    required _i28.ViewDoctorsPrescriptionModel? view,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userPrescriptionDetailScreen,
        arguments: UserPrescriptionDetailScreenArguments(key: key, view: view),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerificationScreenForgotPassword({
    _i22.Key? key,
    required String? email,
    required String? userType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verificationScreenForgotPassword,
        arguments: VerificationScreenForgotPasswordArguments(
            key: key, email: email, userType: userType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDocVidCallLookScreen({
    _i22.Key? key,
    required String? image,
    required String? callId,
    required String? conversationId,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required dynamic sender,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.docVidCallLookScreen,
        arguments: DocVidCallLookScreenArguments(
            key: key,
            image: image,
            callId: callId,
            conversationId: conversationId,
            messageModel: messageModel,
            sender: sender),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJoinVideoChatScreen({
    _i22.Key? key,
    required dynamic agoravalue,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.joinVideoChatScreen,
        arguments:
            JoinVideoChatScreenArguments(key: key, agoravalue: agoravalue),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJoinDoctorVideoChatScreen({
    _i22.Key? key,
    required dynamic agoravalue,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.joinDoctorVideoChatScreen,
        arguments: JoinDoctorVideoChatScreenArguments(
            key: key, agoravalue: agoravalue),
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
    _i22.Key? key,
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
    _i22.Key? key,
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
    _i22.Key? key,
    required String? id,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required _i24.GetListOfDoctorsAppointmentModel? app,
    required _i25.Data? data,
    required dynamic sender,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.doctorChatScreen,
        arguments: DoctorChatScreenArguments(
            key: key,
            id: id,
            messageModel: messageModel,
            app: app,
            data: data,
            sender: sender),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatScreen({
    _i22.Key? key,
    required String? id,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required dynamic sender,
    _i26.GetUsersAppointmentModel? getUsersAppointmentModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatScreen,
        arguments: ChatScreenArguments(
            key: key,
            id: id,
            messageModel: messageModel,
            sender: sender,
            getUsersAppointmentModel: getUsersAppointmentModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDoctorVideoChatScreen({
    _i22.Key? key,
    required int? conversationId,
    required int? receiverId,
    required String? receiverType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.doctorVideoChatScreen,
        arguments: DoctorVideoChatScreenArguments(
            key: key,
            conversationId: conversationId,
            receiverId: receiverId,
            receiverType: receiverType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVideoChatScreen({
    _i22.Key? key,
    required int? conversationId,
    required int? receiverId,
    required String? receiverType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.videoChatScreen,
        arguments: VideoChatScreenArguments(
            key: key,
            conversationId: conversationId,
            receiverId: receiverId,
            receiverType: receiverType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDoctorAppointmentDetailSceen({
    _i22.Key? key,
    _i24.GetListOfDoctorsAppointmentModel? appointment,
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
    _i22.Key? key,
    _i27.Orders? order,
    _i27.Items? item,
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
    _i22.Key? key,
    required String? id,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required _i27.Orders? appOrder,
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
    _i22.Key? key,
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

  Future<dynamic> replaceWithUserPrescriptionDetailScreen({
    _i22.Key? key,
    required _i28.ViewDoctorsPrescriptionModel? view,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userPrescriptionDetailScreen,
        arguments: UserPrescriptionDetailScreenArguments(key: key, view: view),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerificationScreenForgotPassword({
    _i22.Key? key,
    required String? email,
    required String? userType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verificationScreenForgotPassword,
        arguments: VerificationScreenForgotPasswordArguments(
            key: key, email: email, userType: userType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDocVidCallLookScreen({
    _i22.Key? key,
    required String? image,
    required String? callId,
    required String? conversationId,
    required _i23.GetMessageIndexResponseModel? messageModel,
    required dynamic sender,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.docVidCallLookScreen,
        arguments: DocVidCallLookScreenArguments(
            key: key,
            image: image,
            callId: callId,
            conversationId: conversationId,
            messageModel: messageModel,
            sender: sender),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJoinVideoChatScreen({
    _i22.Key? key,
    required dynamic agoravalue,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.joinVideoChatScreen,
        arguments:
            JoinVideoChatScreenArguments(key: key, agoravalue: agoravalue),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJoinDoctorVideoChatScreen({
    _i22.Key? key,
    required dynamic agoravalue,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.joinDoctorVideoChatScreen,
        arguments: JoinDoctorVideoChatScreenArguments(
            key: key, agoravalue: agoravalue),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
