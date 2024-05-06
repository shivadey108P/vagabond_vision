import 'package:flutter/material.dart';
import 'package:vagabond_vision/utilities/constants.dart';

class CustomPill extends StatelessWidget {
  final IconData iconData;
  final String pillName;
  final VoidCallback onTap;
  final TextStyle style;
  const CustomPill({
    super.key,
    required this.iconData,
    required this.pillName,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kDeepOrangeAccent,
            ),
            child: SizedBox(
              width: 60,
              height: 60,
              child: Icon(
                iconData,
                size: 40,
                color: kButtonBackGround,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textAlign: TextAlign.start,
            pillName,
            style: style,
          ),
        ),
      ],
    );
  }
}
