import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  static const String id = 'favourite_screen';
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFA7070),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFEFDED),
        toolbarHeight: 60,
        toolbarOpacity: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
