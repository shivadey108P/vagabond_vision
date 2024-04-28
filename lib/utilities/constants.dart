import 'package:flutter/material.dart';

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

textFieldDecor(String text, Widget icon) => InputDecoration(
      hintText: text,
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

const kNormal = TextStyle(
  fontFamily: 'TiltNeon',
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
);

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
