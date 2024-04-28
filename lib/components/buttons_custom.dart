import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class RoundedRectButton extends StatelessWidget {
  final String textInput;
  final VoidCallback onPressed;
  final Color colour;
  const RoundedRectButton(
      {super.key,
      required this.textInput,
      required this.onPressed,
      required this.colour});

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
        fillColor: colour,
        child: Text(
          textInput,
          style: kButton,
        ),
      ),
    );
  }
}
