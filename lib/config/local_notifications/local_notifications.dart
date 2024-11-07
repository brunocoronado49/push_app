import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static Future<void> requestPermissionLocalNotification() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    
    await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingAndroid = AndroidInitializationSettings('app_icon');
    // TODO: iOS configuration

    const initializationSettings = InitializationSettings(
      android: initializationSettingAndroid,
      // TODO: iOS configuration
    );

    await flutterLocalNotificationsPlugin
      .initialize(
        initializationSettings,
        // TODO
        // onDidReceiveBackgroundNotificationResponse: ,
        // onDidReceiveNotificationResponse: ,
      );
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data
  }) {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('noti'),
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      // TODO iOS
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails, payload: data);
  }
}


