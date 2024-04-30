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
  int selectedIndex = 0;
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String firstName = '';
  late User loggedInUser;

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.view_cozy_outlined, 'text': 'All'},
    {'icon': Icons.apartment, 'text': 'Site'},
    {'icon': Icons.people, 'text': 'Popular'},
    {'icon': Icons.restaurant, 'text': 'Restaurants'},
    {'icon': Icons.theaters, 'text': 'Theater'},
    {'icon': Icons.fort, 'text': 'Historic Places'},
    {'icon': Icons.park, 'text': 'Parks'},
  ];

  final Map<int, List<String>> imageUrls = {
    0: [
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/100',
      'https://via.placeholder.com/200',
      'https://via.placeholder.com/250'
    ],
    1: ['https://via.placeholder.com/200', 'https://via.placeholder.com/150'],
    2: ['https://via.placeholder.com/250', 'https://via.placeholder.com/200'],
    3: ['https://via.placeholder.com/150', 'https://via.placeholder.com/150'],
    // Add more data as needed
  };

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
      final fullName = docSnapshot.data()?['FullName']; // Retrieve 'FullName'

      if (fullName.isNotEmpty) {
        final nameParts = fullName.split(' '); // Extract first name
        firstName =
            nameParts.isNotEmpty ? nameParts[0] : ''; // Get the first name
        setState(() {}); // Update UI with the retrieved first name
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Howdy 👋 $firstName!', // Display first name
                      style: kHeading,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserScreen(),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: kDeepOrangeAccent,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Hyderabad, Telangana, India',
                      style: kLocationText,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Start searching here...',
                    border: OutlineInputBorder(
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
                        child: const Icon(
                          Icons.filter_alt_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Discover Places',
                  style: kHeading,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50, // Fixed height for horizontal ListView.builder()
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedIndex;
                      final backgroundColor =
                          isSelected ? kDeepOrangeAccent : kWhiteCanvas;
                      final textColor =
                          isSelected ? Colors.white : const Color(0xff818f9c);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index; // Update selected index
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  items[index]['icon'],
                                  color: textColor,
                                ),
                                const SizedBox(
                                    width: 5), // Adjusted for smaller items
                                Text(
                                  items[index]['text'],
                                  style: TextStyle(color: textColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedIndex != -1)
                  SizedBox(
                    height: 300, // Ensure consistent height for images
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls[selectedIndex]?.length ?? 0,
                      itemBuilder: (context, idx) {
                        final imageUrl = imageUrls[selectedIndex]?[idx];

                        return Stack(
                          // Use Stack to overlay content on images
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  imageUrl ?? '',
                                  width: 250,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15, // Position the overlay at the bottom
                              left: 15, // Add some offset
                              right: 15, // Add some offset
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                        0.8), // Slight opacity for visibility
                                    borderRadius: BorderRadius.circular(
                                        15), // Circular cutout
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Place Name',
                                        style: kHeading,
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: kDeepOrangeAccent,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'City, State, Country',
                                            style: kLocationText,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 5),
                                          Text('4.0'),
                                          SizedBox(width: 2),
                                          Text('|'),
                                          SizedBox(width: 2),
                                          Text('36 reviews'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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
