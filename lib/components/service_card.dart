import 'package:flutter/material.dart';

import '/utilities/constants.dart';

class ServiceCard extends StatelessWidget {
  final String imageURL;
  final String serviceName;
  final String serviceLocation;
  final IconData iconData;
  final String serviceType;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.imageURL,
    required this.serviceName,
    required this.serviceLocation,
    required this.iconData,
    required this.serviceType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double widthType = 60;
    if (serviceType == 'Restaurant') {
      widthType = 90;
    } else if (serviceType == 'Resort') {
      widthType = 70;
    } else if (serviceType == 'Historic Places') {
      widthType = 120;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 2,
            bottom: 2,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: kWhiteCanvas,
            ),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: NetworkImage(imageURL), fit: BoxFit.cover),
                  ),
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serviceName,
                            style: kServiceText,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 25,
                            width: widthType,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xfffbeeda),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  iconData,
                                  color: const Color(0xffa56a12),
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  serviceType,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffa56a12),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_pin,
                              size: 15,
                              color: kGreyColor,
                            ),
                            Text(
                              serviceLocation,
                              style: kServiceLocationText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 12),
                          const SizedBox(width: 3),
                          const Text(
                            '4.5',
                            style: TextStyle(
                                fontFamily: 'TiltNeon',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          const SizedBox(width: 1),
                          GestureDetector(
                            onTap: () {},
                            child: const Row(
                              children: [
                                SizedBox(width: 1),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    color: kGreyColor,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  '36 Reviews',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'TiltNeon',
                                      color: kGreyColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Rs. 4000',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '/night ',
                            style: TextStyle(
                              color: kGreyColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: const Color(0xffe7e7ef),
                      ),
                    ),
                    height: 70,
                    width: 30,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: kDeepOrangeAccent,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
          thickness: 1,
        )
      ],
    );
  }
}
