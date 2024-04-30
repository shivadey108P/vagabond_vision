import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/utilities/constants.dart';

class ServiceCard extends StatelessWidget {
  final String imageURL;
  final String serviceName;
  final String serviceLocation;
  final IconData iconData;
  final String serviceType;

  const ServiceCard({
    super.key,
    required this.imageURL,
    required this.serviceName,
    required this.serviceLocation,
    required this.iconData,
    required this.serviceType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: NetworkImage(imageURL),
                ),
              ),
              height: 90,
              width: 70,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
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
                        width: 80,
                        margin:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xfffbeeda),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              iconData,
                              color: Color(0xffa56a12),
                              size: 10,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              serviceType,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffa56a12),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
                        color: Color.fromARGB(255, 127, 127, 127),
                      ),
                      Text(
                        serviceLocation,
                        style: kServiceLocationText,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: CupertinoColors.systemGrey3,
                    )),
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
    );
  }
}
