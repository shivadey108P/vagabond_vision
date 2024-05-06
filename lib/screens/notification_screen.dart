import 'package:flutter/material.dart';

import '../components/notification_pill.dart';
import '../data/notification_manager.dart';
import '../utilities/constants.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = 'notification_screen';

  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications =
      NotificationManager().notifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          title: const Text(
            'My Notifications',
            style: kHeading,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return NotificationPill(
            titleNotification: notification['title'],
            subjectNotification: notification['subject'],
            onDelete: () {
              setState(() {
                NotificationManager().deleteNotification(index);
              });
            },
          );
        },
      ),
    );
  }
}
