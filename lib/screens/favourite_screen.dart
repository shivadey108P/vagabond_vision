import 'package:flutter/material.dart';
import 'package:vagabond_vision/utilities/constants.dart';

import '../components/favourite_cards.dart';
import '../data/favourite_manager.dart';

class FavouriteScreen extends StatefulWidget {
  static const String id = 'favourite_screen';
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> favorites = FavoriteManager().favorites;

    return Scaffold(
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
            'My Favourites',
            style: kHeading,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final favorite = favorites[index];
          return FavouriteCard(
            imageURL: favorite['imageUrl'],
            name: favorite['name'],
            location: favorite['location'],
            iconData: Icons.star, // Adjust based on your category logic
            rating: favorite['rating'],
            reviews: favorite['reviews'],
            category: favorite['category'],
            onFavoriteToggle: () {
              setState(() {
                FavoriteManager().removeFavorite(favorite['name']);
              });
            },
          );
        },
      ),
    );
  }
}
