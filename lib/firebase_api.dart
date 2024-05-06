import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Correct import for SharedPreferences
import 'package:vagabond_vision/screens/bottom_navigation_screen.dart';

import '../data/notification_manager.dart';
import 'main.dart';

class FirebaseApi {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleNotification(message);
    });

    // Handle notification tap
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationTap(message);
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    _handleNotification(message);
  }

  static void _handleNotification(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = {
      'title': message.notification!.title ?? '',
      'subject': message.notification!.body ?? '',
    };

    // Add to the NotificationManager
    NotificationManager().addNotification(notification);

    // Persist to SharedPreferences
    _storeNotification(notification);
  }

  static Future<void> _storeNotification(
      Map<String, dynamic> notification) async {
    final prefs = await SharedPreferences.getInstance(); // Corrected method
    List<String> notifications = prefs.getStringList('notifications') ?? [];
    notifications.add(json.encode(notification));
    await prefs.setStringList('notifications', notifications);
  }

  static void _handleNotificationTap(RemoteMessage message) {
    // Handle navigation when a notification is tapped
    navigatorKey.currentState?.pushNamed(BottomNavigation.id);

    final notification = {
      'title': message.notification!.title ?? '',
      'subject': message.notification!.body ?? '',
    };

    _storeNotification(notification);

    NotificationManager().loadNotifications();

    // NotificationManager().addNotification(notification);
  }
}
