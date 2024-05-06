import 'dart:math';

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/favourite_manager.dart';
import '/components/buttons_custom.dart';
import '/components/service_card.dart';
import '/utilities/constants.dart';

class PlaceScreen extends StatefulWidget {
  static const String id = 'place_screen';

  final String imageUrl;
  final String imageUrl2;
  final String imageUrl3;
  final String name;
  final String location;
  final double rating;
  final int reviews;
  final String intro;
  final String category;
  final List<String> serviceImage;
  final List<String> serviceName;
  final List<double> serviceRating;
  final List<int> serviceReviews;
  final List<String> servicePrice;
  final List<String> servicePriceTime;
  final List<String> serviceLocation;
  final List<String> serviceCategories;
  final double latitude;
  final double longitude;
  final double? userLongitude;
  final double? userLatitude;

  const PlaceScreen({
    super.key,
    required this.imageUrl,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.intro,
    required this.category,
    required this.serviceImage,
    required this.serviceName,
    required this.serviceRating,
    required this.serviceReviews,
    required this.servicePrice,
    required this.servicePriceTime,
    required this.serviceLocation,
    required this.latitude,
    required this.longitude,
    required this.userLongitude,
    required this.userLatitude,
    required this.serviceCategories,
  });

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  List<String> sampleImages = [];

  String imageUrl = '';
  String imageUrl2 = '';
  String imageUrl3 = '';
  String name = '';
  String location = '';
  double? rating;
  int? reviews;
  String intro = '';
  String? category;
  List<String>? serviceImage;
  List<String>? serviceCategories;
  List<String>? serviceName;
  List<double>? serviceRating;
  List<int>? serviceReviews;
  List<String>? servicePrice;
  List<String>? servicePriceTime;
  List<String>? serviceLocation;
  double? latitude;
  double? longitude;
  double? userLongitude;
  double? userLatitude;
  double? distance;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
    imageUrl2 = widget.imageUrl2;
    imageUrl3 = widget.imageUrl3;
    name = widget.name;
    location = widget.location;
    rating = widget.rating;
    reviews = widget.reviews;
    intro = widget.intro;
    category = widget.category;
    serviceImage = widget.serviceImage;
    serviceName = widget.serviceName;
    serviceReviews = widget.serviceReviews;
    serviceRating = widget.serviceRating;
    servicePriceTime = widget.servicePriceTime;
    servicePrice = widget.servicePrice;
    serviceLocation = widget.serviceLocation;
    serviceCategories = widget.serviceCategories;
    userLatitude = widget.userLatitude;
    userLongitude = widget.userLongitude;
    latitude = widget.latitude;
    longitude = widget.longitude;

    sampleImages = [
      imageUrl,
      imageUrl2,
      imageUrl3,
    ];
    favLike = FavoriteManager().isFavorite(widget.name);
    distance = calculateDistance();
  }

  double calculateDistance() {
    double? lat1 = userLatitude;
    double? lon1 = userLongitude;
    double? lat2 = latitude;
    double? lon2 = longitude;
    const R = 6371; // Earth's radius in kilometers
    final dLat = _degreesToRadians(lat2! - lat1!);
    final dLon = _degreesToRadians(lon2! - lon1!);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  void toggleFavorite() {
    if (favLike) {
      FavoriteManager().removeFavorite(widget.name);
      Fluttertoast.showToast(msg: 'Removed from Favourites');
    } else {
      FavoriteManager().addFavorite({
        'imageUrl': widget.imageUrl,
        'category': widget.category,
        'location': widget.location,
        'rating': widget.rating,
        'reviews': widget.reviews,
        'name': widget.name,
        'serviceName': widget.serviceName,
        'serviceCategory': widget.serviceCategories,
        'serviceImage': widget.serviceImage,
        'servicePrice': widget.servicePrice,
        'servicePriceTime': widget.servicePriceTime,
        'serviceLocation': widget.serviceLocation,
        'serviceRating': widget.serviceRating,
        'serviceReviews': widget.serviceReviews,
        'imageUrl2': widget.imageUrl2,
        'imageUrl3': widget.imageUrl3,
        'latitude': widget.latitude,
        'longitude': widget.longitude,
        'userLatitude': widget.userLatitude,
        'userLongitude': widget.userLongitude,
        'intro': widget.intro,
      });
      Fluttertoast.showToast(msg: 'Added to Favourites');
    }

    setState(() {
      favLike = !favLike;
    });
  }

  bool favLike = false;

  Future<void> _getDirections() async {
    String url =
        'https://www.google.com/maps/dir/?api=1&origin=$userLatitude,$userLongitude&destination=$latitude,$longitude&travelmode=driving';
    try {
      await launchUrl(
        Uri.parse(url),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    height: 490,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: FanCarouselImageSlider(
                      imagesLink: sampleImages,
                      initalPageIndex: 0,
                      isAssets: false,
                      autoPlay: false,
                      sidesOpacity: 0.8,
                      imageFitMode: BoxFit.cover,
                      expandedImageFitMode: BoxFit.cover,
                      sliderHeight: 450,
                      indicatorActiveColor: kDeepOrangeAccent,
                      expandImageHeight: 400,
                      expandImageWidth: 400,
                    ),
                  ),
                ),
                Positioned(
                  left: 310,
                  top: 400,
                  child: GestureDetector(
                    onTap: toggleFavorite,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      height: 65,
                      width: 65,
                      child: Center(
                        child: favLike
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                color: kDeepOrangeAccent,
                                size: 45,
                              )
                            : const Icon(
                                CupertinoIcons.heart,
                                color: kDeepOrangeAccent,
                                size: 45,
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 498,
                  child: Row(
                    children: [
                      const SizedBox(width: 32),
                      const Icon(Icons.location_pin,
                          color: Color.fromARGB(255, 237, 91, 18), size: 20),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 230, 79, 3),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'TiltNeon',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'TiltNeon',
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 8),
              child: Text(
                intro,
                style: const TextStyle(
                    color: Color.fromARGB(255, 127, 127, 127),
                    fontFamily: 'TiltNeon',
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 5),
              child: SizedBox(
                height: 35,
                width: 450,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 2),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                          fontFamily: 'TiltNeon',
                          fontSize: 13,
                          color: Colors.black),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 255, 248, 248),
                      ),
                      height: 30,
                      width: 120,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            SizedBox(width: 8),
                            Icon(Icons.reviews_outlined,
                                size: 13, color: kDeepOrangeAccent),
                            SizedBox(width: 5),
                            Text(
                              'Read Reviews',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'TiltNeon',
                                  color: kDeepOrangeAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text('|',
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 126, 126))),
                    const SizedBox(width: 3),
                    SvgPicture.asset(
                      'icons/conversion_path.svg', // Path to your colorful Google logo
                      width: 15, // Icon width
                      height: 15,
                      color: kDeepOrangeAccent,
                      // Icon height
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'Approx. ${distance?.toInt()} kms',
                      style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'TiltNeon',
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                'Services in $name',
                style: const TextStyle(
                    color: Color.fromARGB(255, 85, 84, 84),
                    fontFamily: 'TiltNeon',
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 300, // Adjust the height to fit your layout
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:
                    serviceName?.length ?? 0, // Ensure item count is not null
                itemBuilder: (context, index) {
                  // Ensure all required data is available before creating the widget
                  if (serviceImage == null ||
                      serviceName == null ||
                      serviceLocation == null ||
                      servicePrice == null ||
                      servicePriceTime == null ||
                      serviceRating == null ||
                      serviceReviews == null ||
                      serviceCategories == null) {
                    return const Center(
                        child: Text('Service data is missing')); // Fallback
                  }

                  return ServiceCard(
                    imageURL: serviceImage![
                        index], // Non-null because of the check above
                    serviceName: serviceName![index],
                    serviceLocation: serviceLocation![index],
                    iconData: getCategoryIcon(serviceCategories![
                        index]), // Provide default value if null
                    serviceType: serviceCategories![
                        index], // Provide default category if null
                    onTap: () {}, // Handle onTap appropriately
                    servicePrice: servicePrice![index],
                    servicePriceTime: servicePriceTime![index],
                    rating: serviceRating![
                        index], // Access without null-safety check
                    reviews: serviceReviews![index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          color: Colors.transparent,
          child: RoundedRectButton(
            textInput: 'Get Directions',
            onPressed: () {
              _getDirections();
            },
            colour: kDeepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
