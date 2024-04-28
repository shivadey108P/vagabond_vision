import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  BottomNavigationBarItem _createNavigationBarItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: currentIndex == index
            ? kDeepOrangeAccent
            : Colors.black, // Change color based on selection
      ),
      label: currentIndex == index ? '•' : '', // Dot as label for selected
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80, // Increased height for the bottom navigation bar
        color: const Color(0xfffaf9f9),
        clipBehavior: Clip.none, // Background color
        child: BottomNavigationBar(
          currentIndex: currentIndex, // Current selected index
          type: BottomNavigationBarType.fixed, // Avoid animations
          showUnselectedLabels: false, // No labels for unselected icons
          showSelectedLabels: true, // Ensure selected label is visible
          selectedFontSize: 22, // Consistent font size
          unselectedFontSize: 0, // Consistent font size
          iconSize: 27, // Consistent icon size to prevent shifting
          selectedItemColor: kDeepOrangeAccent, // Highlight selected item
          onTap: (index) {
            setState(() {
              currentIndex = index; // Update the selected index
            });
          },
          items: [
            _createNavigationBarItem(FontAwesomeIcons.house, 0), // Home icon
            _createNavigationBarItem(FontAwesomeIcons.heart, 1),
            _createNavigationBarItem(FontAwesomeIcons.bell, 2),
            _createNavigationBarItem(FontAwesomeIcons.user, 3),
          ],
        ),
      ),
      body: screens[currentIndex], // Display the selected screen
    );
  }
}
