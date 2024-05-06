import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kDeepOrangeAccent = Color(0xffde7254);
const kWhiteCanvas = Color(0xfffaf9f9);
const kButtonBackGround = Color(0xffffffff);
const kGreyColor = Color(0xff8e9aa6);
const radius = 35;

const kOnBoardingMessage = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 20.0,
  color: kGreyColor,
);

IconData getCategoryIcon(String category) {
  if (category == 'Restaurants') {
    return Icons.restaurant;
  } else if (category == 'Site') {
    return Icons.apartment;
  } else if (category == 'Hotels') {
    return Icons.hotel;
  } else if (category == 'Theater') {
    return Icons.theaters;
  } else if (category == 'Historic Places') {
    return Icons.fort;
  } else if (category == 'Parks') {
    return Icons.park;
  } else if (category == 'Mountains') {
    return Icons.hiking;
  } else if (category == 'Forest') {
    return Icons.forest;
  } else if (category == 'Beaches') {
    return Icons.beach_access;
  } else if (category == 'Bazaar') {
    return Icons.shopping_bag;
  } else if (category == 'Shopping Mall') {
    return Icons.shopping_bag;
  } else if (category == 'Playground') {
    return Icons.sports_cricket;
  } else if (category == 'Food Court') {
    return Icons.fastfood;
  } else if (category == 'Club') {
    return Icons.wine_bar;
  } else if (category == 'Rowing') {
    return Icons.rowing;
  } else if (category == 'Aquarium') {
    return FontAwesomeIcons.fish;
  }
  throw ArgumentError('Unknown category: $category');
}

const kServiceText = TextStyle(
    fontFamily: 'TiltNeon', fontSize: 16, fontWeight: FontWeight.bold);

const kServiceLocationText = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 127, 127, 127),
    fontFamily: 'TiltNeon');

textFieldDecor(String text, Widget icon, {String? errorText}) =>
    InputDecoration(
      labelStyle: kTextFormFieldStyle,
      hintStyle: kTextFormFieldStyle,
      hintText: text,
      errorText: errorText,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      suffixIcon: icon,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
      ),
    );

const kWelcomeMessage = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 17.0,
  color: kGreyColor,
);

const kOnBoardingHeading = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 32.0,
  fontWeight: FontWeight.w700,
);

const kHeading = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
);

const kHeadingInCards = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
);

const kNormal = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 22.0,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const kTextFormFieldStyle = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const kLocationText = TextStyle(
    fontFamily: 'TiltNeon',
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: kDeepOrangeAccent);

const kLocationTextInCards = TextStyle(
    fontFamily: 'TiltNeon',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: kGreyColor);

const kTextField = TextStyle(
  fontFamily: 'consola',
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
);

const kLogout = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 22.0,
  fontWeight: FontWeight.w900,
  color: kDeepOrangeAccent,
);

const kButton = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kAppBarShapeStyle = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(25),
    bottomLeft: Radius.circular(25),
  ),
);
