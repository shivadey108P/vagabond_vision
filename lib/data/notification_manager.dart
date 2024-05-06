import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class NotificationManager {
  static final NotificationManager _instance = NotificationManager._internal();
  factory NotificationManager() => _instance;

  NotificationManager._internal();

  final List<Map<String, dynamic>> _notifications = [];

  List<Map<String, dynamic>> get notifications =>
      List.unmodifiable(_notifications);

  void addNotification(Map<String, dynamic> notification) {
    _notifications.add(notification);
  }

  Future<void> loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> storedNotifications =
        prefs.getStringList('notifications') ?? [];
    for (String item in storedNotifications) {
      final notification = json.decode(item);
      _notifications.add(notification);
    }
  }

  void deleteNotification(int index) {
    if (index >= 0 && index < _notifications.length) {
      _notifications.removeAt(index);
      _saveNotifications(); // Save the updated list
    }
  }

  Future<void> _saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedNotifications =
        _notifications.map((n) => json.encode(n)).toList();
    await prefs.setStringList('notifications', savedNotifications);
  }
}
