import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<String> getTokenFirebase() async {
  final mess = FirebaseMessaging.instance;
  final token = await mess.getToken() ?? '';
  print('flutter: token: $token');
  return token;
}

Future<void> getPermission() async {
  var messaging = FirebaseMessaging.instance;
  var settings = await messaging.requestPermission();
  await getTokenFirebase();
  print('flutter: User granted permission: ${settings.authorizationStatus}');

  await configuration();

  print('flutter: configuration');

  await onBackgroundMessage();

  print('flutter: onBackgroundMessage');
}

Future<void> foregroundMessages() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('flutter: Got a message whilst in the foreground!');
    print('flutter: Message data: ${message.data}');

    if (message.notification != null) {
      print(
          'flutter: Message also contained a notification: ${message.notification}');
    }
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print('flutter: Handling a background message: ${message.messageId}');
}

Future<void> onBackgroundMessage() async {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

Future<void> configuration() async {
  // IOS
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // IOS

  // Android
  const channel = AndroidNotificationChannel(
    'luinlove',
    'inlove',
    importance: Importance.max,
  );

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  // Android

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    var notification = message.notification;
    var android = message.notification?.android;

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: android.smallIcon,
              // other properties...
            ),
          ));
    }
  });
}
