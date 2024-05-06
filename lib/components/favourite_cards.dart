import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/utilities/constants.dart';

class FavouriteCard extends StatefulWidget {
  final String imageURL;
  final String name;
  final String location;
  final IconData iconData;
  final String category;
  final double rating;
  final int reviews;
  final VoidCallback onFavoriteToggle;
  final VoidCallback goToPlacesScreen;

  const FavouriteCard({
    super.key,
    required this.imageURL,
    required this.iconData,
    required this.rating,
    required this.reviews,
    required this.name,
    required this.location,
    required this.category,
    required this.onFavoriteToggle,
    required this.goToPlacesScreen,
  });

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool favLike = true;

  @override
  Widget build(BuildContext context) {
    double widthType = 60;
    if (widget.category.length <= 5) {
      widthType = 60;
    } else if (widget.category.length > 5 && widget.category.length <= 8) {
      widthType = 75;
    } else if (widget.category.length >= 9 && widget.category.length <= 10) {
      widthType = 95;
    } else if (widget.category.length >= 11 && widget.category.length <= 13) {
      widthType = 100;
    } else {
      widthType = 125;
    }
    return Expanded(
      child: Column(
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
                  GestureDetector(
                    onTap: widget.goToPlacesScreen,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: NetworkImage(widget.imageURL),
                            fit: BoxFit.cover),
                      ),
                      height: 120,
                      width: 120,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: widget.goToPlacesScreen,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
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
                                      widget.iconData,
                                      color: const Color(0xffa56a12),
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.category,
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
                                  widget.location,
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
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 12),
                              const SizedBox(width: 3),
                              Text(
                                widget.rating.toString(),
                                style: const TextStyle(
                                    fontFamily: 'TiltNeon',
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              const SizedBox(width: 1),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const SizedBox(width: 1),
                                    const Text(
                                      '|',
                                      style: TextStyle(
                                        color: kGreyColor,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '${widget.reviews.toString()} Reviews',
                                      style: const TextStyle(
                                          fontSize: 15,
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
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: widget.onFavoriteToggle,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: kDeepOrangeAccent,
                        ),
                      ),
                      height: 45,
                      width: 45,
                      child: Icon(
                        favLike
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: kDeepOrangeAccent,
                        size: 30,
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
      ),
    );
  }
}
