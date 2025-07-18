// ignore_for_file: unnecessary_string_escapes, unnecessary_null_comparison

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_doc_lab/core/core_folder/app/app.router.dart';
import '../main.dart';
import 'connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';

Future<void> handlerBackgroundMessage(RemoteMessage message) async {
  print('object::::${{message.data}}');
}

class FirebaseApi {
  final _firebaseMessage = FirebaseMessaging.instance;

  ///
  final AndroidNotificationChannel _androidChannel =
      const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title// description
        description: 'This channel is used for important notification',
        importance: Importance.defaultImportance,
        playSound: true,
      );
  AppleNotificationSound appleNotificationSound = const AppleNotificationSound(
    critical: true,
    name: 'default.aiff',
    volume: 3,
  );
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    print('serious fb ${message?.data}');
    print('serious fb ${message?.data['caller_type'].runtimeType}');
    if (message == null) return;
    if (message.data['message'] != null &&
        message.data['sender_type'] == 'Doctor') {
      navigate.navigateTo(
        Routes.chatScreen,
        arguments: ChatScreenArguments(
          id: message.data['conversation_id'].toString(),
          messageModel: GetMessageIndexResponseModel(),
          sender: message.data,
        ),
      );
    }
    if (message.data['message'] != null &&
        message.data['sender_type'] == 'User') {
      navigate.navigateTo(
        Routes.doctorChatScreen,
        arguments: DoctorChatScreenArguments(
          id: message.data['conversation_id'].toString(),
          messageModel: GetMessageIndexResponseModel(),
          app: null,
          data: null,
          sender: message.data,
        ),
      );
    }

    if (message.data['agora_token'] != null &&
        message.data['caller_type'] == 'MydocLab\Models\Doctor') {
      navigate.navigateTo(
        Routes.joinVideoChatScreen,
        arguments: JoinVideoChatScreenArguments(agoravalue: message.data),
      );
    }
    if (message.data['agora_token'] != null &&
        message.data['caller_type'] == 'MydocLab\Models\User') {
      navigate.navigateTo(
        Routes.joinDoctorVideoChatScreen,
        arguments: JoinDoctorVideoChatScreenArguments(agoravalue: message.data),
      );
    }
    // navigation to screens when push notification pops should be implemented here
  }

  Future initLocalNotification() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings("@drawable/la_hands");
    const settings = InitializationSettings(android: android, iOS: ios);
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    final platform =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    platform?.createNotificationChannel(_androidChannel);
  }

  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse, {
    context,
  }) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      print('notification payload: $payload');
      final message = RemoteMessage.fromMap(jsonDecode(payload!));
      handleMessage(message);
    }
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handlerBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: "@drawable/la_hands",
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );

      if (message.data != null) {
        print('push mes::vv::${message.data}');
        if (message.data.containsKey('agora_token')) {
          if (message.data['caller_type'] == 'MydocLab\Models\User') {
            print('push mes::user::${message.data}');
            navigate.navigateTo(
              Routes.docVidCallLookScreen,
              arguments: DocVidCallLookScreenArguments(
                conversationId: message.data['conversation_id'],
                sender: message.data,
                image: message.data['caller_image'],
                callId: message.data['call_id'].toString(),
              ),
            );
          } else {
            print('push mes::::${message.data}');
            navigate.navigateTo(
              Routes.vidCallLookScreen,
              arguments: VidCallLookScreenArguments(
                conversationId: message.data['conversation_id'],
                sender: message.data,
                image: message.data['caller_image'],
                callId: message.data['call_id'].toString(),
              ),
            );
          }
        }
      }
    });
  }

  Future<void> _initNotification() async {
    // Request permission
    NotificationSettings settings = await _firebaseMessage.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // Get APNs token (iOS only)
      String? apnsToken = await _firebaseMessage.getAPNSToken();
      if (apnsToken != null) {
        print("APNs Token: $apnsToken");
      } else {
        print(
          "APNs token is still null. Ensure push notifications are enabled.",
        );
      }

      // Get FCM token
      String? fcmToken = await _firebaseMessage.getToken();
      print("FCM Token: $fcmToken");
    } else {
      print('User declined or has not accepted notification permissions');
    }
  }

  Future<void> initNotification() async {
    await _firebaseMessage.requestPermission();
    globalfCMToken = await _firebaseMessage.getToken();
    initPushNotification();
    initLocalNotification();
    _initNotification();
  }
}
