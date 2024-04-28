import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/components/custom_pill.dart';
import '/utilities/constants.dart';
import 'bottom_navigation_screen.dart';
import 'onboarding_screen.dart';

class UserScreen extends StatefulWidget {
  static const String id = 'user_screen';
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Background color
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            // Enable scrolling
            child: Padding(
              // Optional: Add padding for consistent spacing
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // Use Column for vertical stacking
                crossAxisAlignment: CrossAxisAlignment.start, // Align items
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BottomNavigation.id);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Profile Information',
                        style: kHeading,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              // Navigate to UserScreen
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const UserScreen(), // Target screen
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/boy.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              'User Name',
                              style: kHeading,
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              'User email',
                              style: kOnBoardingMessage,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        customPill(
                          iconData: Icons.person,
                          pillName: 'My Profile',
                          onTap: () {},
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customPill(
                          iconData: Icons.settings,
                          pillName: 'Settings',
                          onTap: () {},
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customPill(
                          iconData: Icons.question_answer,
                          pillName: 'FAQ',
                          onTap: () {},
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customPill(
                          iconData: Icons.person_search_rounded,
                          pillName: 'About App',
                          onTap: () {},
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customPill(
                          iconData: Icons.help,
                          pillName: 'Help',
                          onTap: () {},
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customPill(
                          iconData: Icons.logout,
                          pillName: 'Logout',
                          onTap: () {
                            setState(() {
                              showSpinner = true;
                            });
                            _auth.signOut();
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                OnBoardingScreen.id,
                                (Route<dynamic> route) => false);
                            setState(() {
                              showSpinner = false;
                            });
                          },
                          style: kLogout,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
