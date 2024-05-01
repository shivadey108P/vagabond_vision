import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vagabond_vision/data/places.dart';
import 'package:vagabond_vision/screens/user_screen.dart';
import 'package:vagabond_vision/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // Default category index
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String firstName = '';
  late User loggedInUser;

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.view_cozy_outlined, 'text': 'All'},
    {'icon': Icons.apartment, 'text': 'Site'},
    {'icon': Icons.hotel, 'text': 'Hotels'},
    {'icon': Icons.restaurant, 'text': 'Restaurants'},
    {'icon': Icons.theaters, 'text': 'Theater'},
    {'icon': Icons.fort, 'text': 'Historic Places'},
    {'icon': Icons.park, 'text': 'Parks'},
  ];

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
    final docSnapshot = await _fireStore.collection('UserData').doc(uid).get();
    if (docSnapshot.exists) {
      final fullName = docSnapshot.data()?['FullName'];
      if (fullName != null) {
        firstName = fullName.split(' ')[0]; // Extract first name
        setState(() {}); // Update UI with the retrieved first name
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve place data based on the selected index
    final placesList = Places.placeData[items[selectedIndex]['text']] ?? [];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Howdy 👋 $firstName!',
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
                    backgroundImage:
                        AssetImage('images/boy.jpg'), // Profile image
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
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update the selected index
                      });
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, right: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: isSelected ? kDeepOrangeAccent : Colors.white,
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
                              color:
                                  isSelected ? Colors.white : kDeepOrangeAccent,
                            ),
                            Text(
                              items[index]['text'],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : kDeepOrangeAccent,
                              ),
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
            // Horizontal list of places based on the selected index
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: placesList.length,
                itemBuilder: (context, idx) {
                  final place =
                      placesList[idx]; // Retrieve individual place data

                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            place.imageUrl,
                            width: 250,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        right: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place.name,
                                  style: kHeadingInCards,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: kGreyColor,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      place.location,
                                      style: kLocationTextInCards,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${place.rating}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    const Text(
                                      '|',
                                      style: TextStyle(
                                        color: kGreyColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '${place.reviews} reviews',
                                      style: const TextStyle(
                                        color: kGreyColor,
                                        fontSize: 15,
                                      ),
                                    ),
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
    );
  }
}
