import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/utilities/constants.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';
import 'user_screen.dart';

class BottomNavigation extends StatefulWidget {
  static const String id = 'bottomNav_screen';
  const BottomNavigation({Key? key}) : super(key: key);

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

  BottomNavigationBarItem _createNavigationBarItem(
      IconData icon, IconData icon2, int index) {
    return BottomNavigationBarItem(
      label: '',
      icon: Icon(
        currentIndex == index ? icon2 : icon,
        color: currentIndex == index
            ? kDeepOrangeAccent
            : const Color(0xff818f9c), //
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        clipBehavior: Clip.none, // Background color
        child: BottomNavigationBar(
          elevation: 15,
          enableFeedback: false,
          currentIndex: currentIndex, // Current selected index

          showUnselectedLabels: false, // No labels for unselected icons
          showSelectedLabels: false, // Ensure selected label is visible
          iconSize: 24, // Consistent icon size to prevent shifting
          selectedItemColor: kDeepOrangeAccent,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24),

          onTap: (index) {
            setState(() {
              currentIndex = index; // Update the selected index
            });
          },
          items: [
            _createNavigationBarItem(CupertinoIcons.house,
                CupertinoIcons.house_fill, 0), // Home icon
            _createNavigationBarItem(
                CupertinoIcons.heart, CupertinoIcons.heart_solid, 1),
            _createNavigationBarItem(
                CupertinoIcons.bell, CupertinoIcons.bell_fill, 2),
            _createNavigationBarItem(
                CupertinoIcons.person, CupertinoIcons.person_fill, 3),
          ],
        ),
      ),
      body: screens[currentIndex], // Display the selected screen
    );
  }
}
