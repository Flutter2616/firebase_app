import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;

class Notificationservice {
  static Notificationservice service = Notificationservice._();

  Notificationservice._();

  FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("logo");
    DarwinInitializationSettings iossettings = DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iossettings);
    await notification.initialize(initializationSettings);
    tz.initializeTimeZones();
  }

  void simpleNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", 'simple',
            priority: Priority.high, importance: Importance.high);
    DarwinNotificationDetails iosdetail = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosdetail);
    notification.show(
        1, "Add product", "flutter local notification", notificationDetails);
  }

  void timeNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('2', 'time',
            importance: Importance.high, priority: Priority.high);
    DarwinNotificationDetails iosdetail = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        iOS: iosdetail, android: androidNotificationDetails);
    notification.zonedSchedule(
        1,
        "flutter notiication",
        "local time",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 3)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void soundNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("3", 'sound',
            sound: RawResourceAndroidNotificationSound("sound"),
            priority: Priority.high,
            importance: Importance.high);
    DarwinNotificationDetails iosdetail = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosdetail);
    notification.show(
        1, "Add product", "flutter sound notification", notificationDetails);
  }

  Future<void> image_Notification() async {
    Future<Uint8List> _getByteArrayFromUrl(String url) async {
      final http.Response response = await http.get(Uri.parse(url));
      return response.bodyBytes;
    }

    Uint8List img = await _getByteArrayFromUrl(
        "https://images-eu.ssl-images-amazon.com/images/G/31/img21/Fashion/Event/N2GL_sep/Ingress-SEP.jpg");
    ByteArrayAndroidBitmap bigimage = ByteArrayAndroidBitmap(img);

    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(bigimage);
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("4", "big picture notification",
            priority: Priority.high,
            styleInformation: bigPictureStyleInformation,
            importance: Importance.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notification.show(
        4, "big picture", "notification", notificationDetails);
  }

  void fire_Notification({title, body}) {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("4", 'fire',
            priority: Priority.high, importance: Importance.high);
    DarwinNotificationDetails iosdetail = DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosdetail);
    notification.show(1, "$title", "$body", notificationDetails);
  }
}
