import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sunnah_songi/app/common/services/notification_helper.dart';
import 'package:sunnah_songi/firebase_options.dart';

class FirebaseMessageHelper {
  FirebaseMessageHelper._();
  static late FirebaseMessaging messaging;

  /// this function will initialize firebase and fcm instance
  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      messaging = FirebaseMessaging.instance;
      var token = await  FirebaseMessaging.instance.getToken;
      print("======> ${token}");
      // await _setupFcmNotificationSettings();
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      print("Error======$error");
    }
  }


  @pragma('vm:entry-point')
//handle fcm notification when app is in background
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    print("onBackgroundMessage: ${message.data}");
    await handleNotifications(payload: message.data);
  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    print("Recived Notificationsssss===>>>>>>: ${message.data}");
    await AwesomeNotifications().createNotification(content: NotificationContent(
            id: 45,
            channelKey: 'basic_channel',
            title:  message.data['title'],
            body:  message.data['body'],
          ),);

    // await handleNotifications(payload: message.data);
  }

  static handleNotifications({required Map<String, dynamic> payload}) async {
      // await NotificationsHelper.showNotification(
      //   title: payload["topic"] ?? "",
      //   body: payload["des"] ?? "",
      //   bigPicture: payload["image"] ?? "",
      //   payload: Map<String, String>.from(payload),
      // );
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title:  payload["topic"] ?? "",
            body: payload["des"] ?? "",
          ),
        );
  }
}