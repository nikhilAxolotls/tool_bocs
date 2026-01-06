import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  Future<void> init() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();

    FirebaseMessaging.onMessage.listen((message) {
      // handle foreground notification
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // handle tap on notification
    });
  }
}
