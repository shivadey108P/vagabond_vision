import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/utilities/constants.dart';
import 'user_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
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

  void getUserData() async {
    final data = await _firestore.collection('UserData').get();
    for (var userData in data.docs) {
      print(userData.data());
    }
  }

  void getUserStream() async {
    await for (var snapshot in _firestore.collection('UserData').snapshots()) {
      for (var userData in snapshot.docs) {
        print(userData.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Background color
        body: SingleChildScrollView(
          // Enable scrolling
          child: Padding(
            // Optional: Add padding for consistent spacing
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // Use Column for vertical stacking
              crossAxisAlignment: CrossAxisAlignment.start, // Align items
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Howday 👋 Shiva!',
                      style: kHeading,
                    ),
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
                        radius: 25,
                        backgroundImage: AssetImage('images/boy.jpg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  onTap: () {
                    getUserStream();
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Start searching here...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: kDeepOrangeAccent,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kDeepOrangeAccent,
                        ),
                        child: const SizedBox(
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
