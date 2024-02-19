import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer' as dev;

import 'package:woolify/Other/Notification.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification?.title.toString());
  print(message.notification?.body.toString());
}

class FirebaseNotifiApi {
  final fireBaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await fireBaseMessaging.requestPermission();
    final FMCtoken = await fireBaseMessaging.getToken();
    dev.log(FMCtoken.toString(), name: "firebase Token");
    FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((event) {
      CustomNotiFication.showNotification(
          title: event.notification == null
              ? ""
              : event.notification!.title.toString(),
          body: event.notification == null
              ? ""
              : event.notification!.body.toString());
    });
  }
}
