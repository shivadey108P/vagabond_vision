import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vagabond_vision/components/service_card.dart';
import 'package:vagabond_vision/data/places.dart';
import 'package:vagabond_vision/screens/places_screen.dart';
import 'package:vagabond_vision/screens/user_screen.dart';
import 'package:vagabond_vision/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // Default category index
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String firstName = '';
  late User loggedInUser;
  String userLocation = '';
  String updatedUserLocation = '';
  String selectedCategory = 'All';
  late List<Place> filteredPlaces;
  late List<Place> peopleLikedPlaces;
  double? latitude;
  double? longitude;
  String gender = '';

  void _onSearch() {
    setState(() {
      // Update user location and call _updateFilteredPlaces
      userLocation = updatedUserLocation;
      _updateFilteredPlaces();
    });
  }

  final TextEditingController _controller = TextEditingController();
  List<String> _filteredCities = [];

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.widgets, 'text': 'All'},
    {'icon': Icons.apartment, 'text': 'Site'},
    {'icon': Icons.hotel, 'text': 'Hotels'},
    {'icon': Icons.restaurant, 'text': 'Restaurants'},
    {'icon': Icons.theaters, 'text': 'Theater'},
    {'icon': Icons.fort, 'text': 'Historic Places'},
    {'icon': Icons.park, 'text': 'Parks'},
    {'icon': Icons.forest, 'text': 'Forest'},
    {'icon': Icons.hiking, 'text': 'Mountains'},
    {'icon': Icons.beach_access, 'text': 'Beaches'}
  ];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _getUserLocation();
    _updateFilteredPlaces();
    _updatePeopleLikedPlaces();
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
      final gen = docSnapshot.data()?['gender'];
      if (fullName != null) {
        firstName = fullName.split(' ')[0];
        gender = gen;
        setState(() {}); // Update UI with the retrieved first name
      }
    }
  }

  void _getUserLocation() async {
    try {
      // Check and request permission if needed
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return; // Location services are disabled
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return; // Location permission denied
      }

      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      // Use geocoding to get the address
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      latitude = position.latitude;
      longitude = position.longitude;

      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks.first;
        setState(() {
          userLocation =
              '${place.locality}, ${place.administrativeArea}, ${place.country}';
          _updateFilteredPlaces();
        });
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error getting location: $e');
    }
  }

  void _updateFilteredPlaces() {
    var userCountry = _getCountryFromLocation(userLocation);

    filteredPlaces = Places.placeData['All']?.where((place) {
          // If selectedCategory is 'All', include places based on the user's country
          if (selectedCategory == 'All') {
            return (place.location.contains(userCountry) ||
                place.name.contains(
                    userCountry)); // Ensure place is in the same country
          } else {
            return place.category == selectedCategory &&
                place.location.contains(userCountry);
          }
        }).toList() ??
        [];
  }

  void _updatePeopleLikedPlaces() {
    peopleLikedPlaces = Places.placeData['All']?.where((place) {
          // If selectedCategory is 'All', include places based on the user's country
          if (selectedCategory == 'All') {
            return (place.reviews >= 10000 &&
                place.rating > 3.5); // Ensure place is in the same country
          } else {
            return place.reviews >= 300 && place.rating > 4.5;
          }
        }).toList() ??
        [];
  }

  String _getCountryFromLocation(String location) {
    var locationParts = location.split(', ');
    return locationParts.length >= 3
        ? locationParts[2]
        : ''; // The third part is usually the country
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve place data based on the selected index
    // final placesList = Places.placeData[items[selectedIndex]['text']] ?? [];

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
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: gender == 'Male'
                        ? const AssetImage('images/boy.jpg')
                        : const AssetImage('images/girl.jpg'),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.low,
                );
                List<Placemark> placeMarks = await placemarkFromCoordinates(
                  position.latitude,
                  position.longitude,
                );
                if (placeMarks.isNotEmpty) {
                  Placemark place = placeMarks.first;
                  setState(() {
                    userLocation =
                        '${place.locality}, ${place.administrativeArea}, ${place.country}';
                  });
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: kDeepOrangeAccent,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    userLocation,
                    style: kLocationText,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                if (value != '') {
                  updatedUserLocation = value;
                } else {
                  Fluttertoast.showToast(msg: 'Please enter a valid location');
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Start searching here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: GestureDetector(
                  onTap: _onSearch,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.orange,
                      size: 35,
                    ),
                  ),
                ),
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.only(right: 5.0),
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.orange,
                //     ),
                //     child: const Icon(
                //       Icons.filter_alt_outlined,
                //       size: 24,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ),
            ),

            if (_filteredCities.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredCities.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredCities[index]),
                      onTap: () {
                        // Set the selected city to the TextField and clear suggestions
                        setState(() {
                          _controller.text = _filteredCities[index];
                          _filteredCities = [];
                        });
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 15),
            const Text(
              'Discover Places',
              style: kHeading,
            ),
            const SizedBox(height: 15),
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
                        selectedCategory = items[index]
                            ['text']; // Update the selected category
                        _updateFilteredPlaces(); // Update filtered places based on category
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
                              size: 18,
                              color:
                                  isSelected ? Colors.white : kDeepOrangeAccent,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              items[index]['text'],
                              style: TextStyle(
                                fontSize: 18,
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
                itemCount: filteredPlaces.length,
                itemBuilder: (context, idx) {
                  final place =
                      filteredPlaces[idx]; // Retrieve individual place data

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceScreen(
                            imageUrl: place.imageUrl,
                            imageUrl2: place.imageUrl2,
                            imageUrl3: place.imageUrl3,
                            name: place.name,
                            location: place.location,
                            rating: place.rating,
                            reviews: place.reviews,
                            intro: place.intro,
                            category: place.category,
                            serviceImage: place.serviceImage,
                            serviceName: place.serviceName,
                            serviceRating: place.serviceRating,
                            serviceReviews: place.serviceReviews,
                            servicePrice: place.servicePrice,
                            servicePriceTime: place.servicePriceTime,
                            serviceLocation: place.serviceLocation,
                            latitude: place.latitude,
                            longitude: place.longitude,
                            userLatitude: latitude,
                            userLongitude: longitude,
                            serviceCategories: place.serviceCategory,
                          ),
                        ),
                      );
                    },
                    child: Stack(
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
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'People Liked Worldwide',
                  style: kHeading,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        'View all',
                        style: kLocationText,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: kDeepOrangeAccent,
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 300,
              child: peopleLikedPlaces.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final place = peopleLikedPlaces[index];
                        return ServiceCard(
                          imageURL: place.imageUrl,
                          serviceName: place.name,
                          serviceLocation: place.location,
                          iconData: getCategoryIcon(place.category),
                          serviceType: place.category,
                          servicePrice: place.servicePrice.isNotEmpty
                              ? place.servicePrice[0]
                              : 'N/A',
                          servicePriceTime: place.servicePriceTime.isNotEmpty
                              ? place.servicePriceTime[0]
                              : 'N/A',
                          rating: place.rating,
                          reviews: place.reviews,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlaceScreen(
                                  imageUrl: place.imageUrl,
                                  imageUrl2: place.imageUrl2,
                                  imageUrl3: place.imageUrl3,
                                  name: place.name,
                                  location: place.location,
                                  rating: place.rating,
                                  reviews: place.reviews,
                                  intro: place.intro,
                                  category: place.category,
                                  serviceImage: place.serviceImage,
                                  serviceName: place.serviceName,
                                  serviceRating: place.serviceRating,
                                  serviceReviews: place.serviceReviews,
                                  servicePrice: place.servicePrice,
                                  servicePriceTime: place.servicePriceTime,
                                  serviceLocation: place.serviceLocation,
                                  latitude: place.latitude,
                                  longitude: place.longitude,
                                  userLatitude: latitude,
                                  userLongitude: longitude,
                                  serviceCategories: place.serviceCategory,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : const Center(child: Text("No popular places found")),
            ),
          ],
        ),
      ),
    );
  }
}
