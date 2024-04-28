import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = 'notification_screen';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFA7070),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFEFDED),
        toolbarHeight: 60,
        toolbarOpacity: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
