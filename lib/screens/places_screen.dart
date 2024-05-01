import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/components/buttons_custom.dart';
import '/components/service_card.dart';
import '/utilities/constants.dart';

class PlaceScreen extends StatefulWidget {
  static const String id = 'place_screen';

  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  bool favLike = true;
  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/beautiful-volcano-landscape_23-2150787896.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvFPrUA9q-DW96GA_Jv-NfGsK-mQ0qXxs5boZ94PUOSw&s'
        'https://savorjapan.com/gg/content_image/t0093_030_20180420032213.jpg',
    'https://www.agoda.com/wp-content/uploads/2021/03/Lake-Kawaguchi-Fujikawaguchiko-attractions-Japan.jpg',
  ];

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
                    child: Expanded(
                      child: FanCarouselImageSlider(
                        imagesLink: sampleImages,
                        isAssets: false,
                        autoPlay: false,
                        imageFitMode: BoxFit.fill,
                        expandedImageFitMode: BoxFit.fill,
                        sliderHeight: 400,
                        expandImageHeight: 490,
                        expandImageWidth: 300,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 330,
                  top: 445,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        favLike = !favLike;
                        !favLike
                            ? Fluttertoast.showToast(msg: 'Added to Favourites')
                            : Fluttertoast.showToast(
                                msg: 'Removed from Favourites');
                      });
                    },
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
                                Icons.favorite_outline,
                                color: Color.fromARGB(255, 239, 66, 22),
                                size: 45,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 239, 66, 22),
                                size: 45,
                              ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 498,
                  child: Row(
                    children: [
                      SizedBox(width: 32),
                      Icon(Icons.location_pin,
                          color: Color.fromARGB(255, 237, 91, 18), size: 20),
                      Text(
                        'Fuji Mountain, JAPAN',
                        style: TextStyle(
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
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: Text(
                'Fuji Mountain',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'TiltNeon',
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35, right: 8),
              child: Text(
                'Fuji is the tallest peak in Japan, the result of volcanic activity that began approximately 100,000 years ago. Today, Mt. Fuji and the surrounding area are a popular recreational destination for hiking, camping and relaxation.',
                style: TextStyle(
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
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 3),
                    const Text(
                      '4.5',
                      style: TextStyle(
                          fontFamily: 'TiltNeon',
                          fontSize: 15.5,
                          color: Colors.black),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 255, 248, 248),
                      ),
                      height: 30,
                      width: 135,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            SizedBox(width: 8),
                            Icon(Icons.reviews_outlined,
                                size: 15, color: kDeepOrangeAccent),
                            SizedBox(width: 5),
                            Text(
                              'Read Reviews',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'TiltNeon',
                                  color: kDeepOrangeAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('|',
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 126, 126))),
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'icons/conversion_path.svg', // Path to your colorful Google logo
                      width: 20, // Icon width
                      height: 20,
                      color: kDeepOrangeAccent,
                      // Icon height
                    ),
                    const SizedBox(width: 5),
                    const Text('30 min by car',
                        style: TextStyle(
                            fontSize: 15.5,
                            fontFamily: 'TiltNeon',
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 35),
              child: Text(
                'Services in Fuji Mountains',
                style: TextStyle(
                    color: Color.fromARGB(255, 85, 84, 84),
                    fontFamily: 'TiltNeon',
                    fontSize: 20),
              ),
            ),
            const ServiceCard(
              imageURL:
                  'https://www.agoda.com/wp-content/uploads/2021/03/Ubuya-best-Fujikawaguchiko-hotels-where-to-stay-ryokans-onsen-resorts.jpg',
              serviceName: 'Ubuya Resort',
              serviceLocation: 'Yamanashi, Japan',
              iconData: Icons.apartment,
              serviceType: 'Resort',
            ),
            const ServiceCard(
              imageURL:
                  'https://savorjapan.com/gg/content_image/t0093_030_20180420032213.jpg',
              serviceName: 'Fuji Tempura Idaten',
              serviceLocation: 'Yamanashi, Japan',
              iconData: Icons.restaurant,
              serviceType: 'Restaurant',
            ),
            const ServiceCard(
              imageURL:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvFPrUA9q-DW96GA_Jv-NfGsK-mQ0qXxs5boZ94PUOSw&s',
              serviceName: 'Narusawa Ice Cave',
              serviceLocation: 'Yamanashi, Japan',
              iconData: Icons.map,
              serviceType: 'Cave',
            ),
            const ServiceCard(
              imageURL:
                  'https://www.agoda.com/wp-content/uploads/2021/03/Lake-Kawaguchi-Fujikawaguchiko-attractions-Japan.jpg',
              serviceName: 'Lake Kawaguchiko',
              serviceLocation: 'Yamanashi, Japan',
              iconData: Icons.kayaking,
              serviceType: 'Lake',
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
            onPressed: () {},
            colour: kDeepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
