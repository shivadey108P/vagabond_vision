import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vagabond_vision/utilities/constants.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 15.0,
        constraints: const BoxConstraints.tightFor(
          width: double.maxFinite,
          height: 70.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        fillColor: Colors.white, // White background
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google icon
            SvgPicture.asset(
              'icons/google_logo.svg', // Path to your colorful Google logo
              width: 24, // Icon width
              height: 24, // Icon height
            ),
            const SizedBox(width: 15), // Space between icon and text
            const Text(
              'Login with Google', // Button text
              style: kButton,
            ),
          ],
        ),
      ),
    );
  }
}
