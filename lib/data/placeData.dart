import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PlaceData {
  int selectedIndex = 0;
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String locationPlace = '';
  late User loggedInUser;

  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      findDocumentByUID(); // Find the Firestore document by UID
    }
  }

  Future<String> findDocumentByUID() async {
    late String locationPlace;
    final docSnapshot = await _fireStore
        .collection('placeData')
        .doc('India/places/Charminar')
        .get(); // Using UID as document ID

    if (docSnapshot.exists) {
      final location = docSnapshot.data()?['imageULR'];
      locationPlace = location;
    }
    return locationPlace;
  }
}
