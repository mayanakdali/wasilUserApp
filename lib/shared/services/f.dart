import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
    'android_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class FlutterNotificationView {
  void showNotification(String title, String body) {
    flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                androidChannel.id, androidChannel.name,
                importance: Importance.max,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("***************************************************");
    // print(
    //     'A bg message just showed up :  ${message.data} ${message.notification}');

    // if (message.data != null) {
    //   print('Data: ${message.data}');
    // }
    //
    // if (message.notification != null) {
    //   print('Notification: ${message.notification}');
    //   showNotification('55555', '555555555');
  //  }

    showNotification(
      '55555',  '555555555');
  }

  FlutterNotificationView() {
    _setupAlert();
  }

  void _setupAlert() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}