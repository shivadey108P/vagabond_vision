import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/components/custom_pill.dart';
import '/utilities/constants.dart';
import 'onboarding_screen.dart';

class UserScreen extends StatefulWidget {
  static const String id = 'user_screen';
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _auth = FirebaseAuth.instance;
  String name = '';
  String email = '';
  bool showSpinner = false;
  late User loggedInUser;
  final _fireStore = FirebaseFirestore.instance;

  String gender = '';

  @override
  void initState() {
    super.initState();
    getCurrentUser(); // Retrieve current user data
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      findDocumentByUID(loggedInUser.uid); // Find the Firestore document by UID
    }
  }

  void findDocumentByUID(String uid) async {
    final docSnapshot = await _fireStore
        .collection('UserData')
        .doc(uid)
        .get(); // Using UID as document ID

    if (docSnapshot.exists) {
      final fullName = docSnapshot.data()?['FullName'];
      final emailId = docSnapshot.data()?['email'];
      final gen = docSnapshot.data()?['gender'];

      if (fullName != null && fullName.isNotEmpty) {
        final nameParts = fullName.split(' '); // Extract first name
        name = nameParts.isNotEmpty ? nameParts[0] : '';
        email = emailId;
        gender = gen;
        setState(() {}); // Update UI with the retrieved first name
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              'Profile Information',
              style: kHeading,
            ),
          ),
        ),
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg:
                                    "This functionality is not yet developed!");
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: gender == 'Male'
                                ? const AssetImage('images/boy.jpg')
                                : const AssetImage('images/girl.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              name,
                              style: kHeading,
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              email,
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
                        CustomPill(
                          iconData: Icons.person,
                          pillName: 'My Profile',
                          onTap: () {
                            Fluttertoast.showToast(
                                msg:
                                    "This functionality is not yet developed!");
                          },
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomPill(
                          iconData: Icons.settings,
                          pillName: 'Settings',
                          onTap: () {
                            Fluttertoast.showToast(
                                msg:
                                    "This functionality is not yet developed!");
                          },
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomPill(
                          iconData: Icons.question_answer,
                          pillName: 'FAQ',
                          onTap: () {
                            Fluttertoast.showToast(
                                msg:
                                    "This functionality is not yet developed!");
                          },
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomPill(
                          iconData: Icons.person_search_rounded,
                          pillName: 'About App',
                          onTap: () {
                            Fluttertoast.showToast(
                                msg:
                                    "This functionality is not yet developed!");
                          },
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomPill(
                          iconData: Icons.help,
                          pillName: 'Help',
                          onTap: () {
                            Fluttertoast.showToast(
                                msg:
                                    "This functionality is not yet developed!");
                          },
                          style: kNormal,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomPill(
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
