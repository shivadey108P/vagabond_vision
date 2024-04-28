import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/components/buttons_custom.dart';
import '/utilities/constants.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = 'onboarding_screen';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xfffaf9f9),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Consistent alignment
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: const AssetImage('images/travel.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.8), BlendMode.multiply),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Hero(
                tag: "Heading",
                child: Text(
                  'Discover best places to go to vacation 😍',
                  style: kOnBoardingHeading,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Ensure consistent height with ConstrainedBox
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 70), // Fixed height
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Hero(
                  tag: "SubHeading",
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText(
                        "Once a year, go someplace you've never been before.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "Travel is the only thing you buy that makes you richer.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "Life is short, and the world is wide.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "Adventure is worthwhile.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "If it scares you, it may be a good thing to try.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "Travel makes one modest. You see what a tiny place you occupy in the world.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "Travelling – it leaves you speechless, then turns you into a storyteller.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "People don’t take trips, trips take people.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                      RotateAnimatedText(
                        "Not all those who wander are lost.",
                        textStyle: kOnBoardingMessage,
                        duration: const Duration(seconds: 5),
                      ),
                    ],
                    totalRepeatCount: 5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30), // Consistent spacing
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'login',
                    child: RoundedRectButton(
                      textInput: 'Login',
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      colour: kDeepOrangeAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Hero(
                    tag: "Signup",
                    child: RoundedRectButton(
                      textInput: 'Sign up',
                      onPressed: () {
                        Navigator.pushNamed(context, SignupScreen.id);
                      },
                      colour: kWhiteCanvas,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
