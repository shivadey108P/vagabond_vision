import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vagabond_vision/screens/user_screen.dart';
import 'package:vagabond_vision/utilities/constants.dart';

import '../data/notification_manager.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';

class BottomNavigation extends StatefulWidget {
  static const String id = 'bottomNav_screen';

  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0; // Track the current selected index
  List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    NotificationScreen(),
    UserScreen(),
  ];

  bool _hasNewNotifications() {
    return NotificationManager()
        .notifications
        .isNotEmpty; // Check if there's a notification
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kDeepOrangeAccent,
        unselectedItemColor: Colors.black,
        iconSize: 25,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex, // The currently selected index
        onTap: (index) {
          setState(() {
            currentIndex = index; // Change the selected index
          });
        },
        items: [
          // Define your BottomNavigationBar items here
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 0
                ? CupertinoIcons.house_fill
                : CupertinoIcons.house),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 1
                ? CupertinoIcons.heart_fill
                : CupertinoIcons.heart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(currentIndex == 2
                    ? CupertinoIcons.bell_fill
                    : CupertinoIcons.bell),
                if (_hasNewNotifications() &&
                    currentIndex !=
                        2) // Show red dot only when it's not the selected tab
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: kDeepOrangeAccent,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 3
                ? CupertinoIcons.person_alt
                : CupertinoIcons.person),
            label: '',
          ),
        ],
      ),
      body: screens[currentIndex], // Display the current screen
    );
  }
}
