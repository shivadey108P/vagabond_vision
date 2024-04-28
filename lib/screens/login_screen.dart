import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/components/buttons_custom.dart';
import '/components/google_button.dart';
import '/utilities/constants.dart';
import 'bottom_navigation_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          // Allows vertical scrolling to avoid overflow
          child: Padding(
            padding: const EdgeInsets.all(
                16.0), // Overall padding for consistent spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 70),
                const Hero(
                  tag: 'Heading',
                  child: Text(
                    "Welcome Back! 😍",
                    style: kOnBoardingHeading,
                  ),
                ),
                const SizedBox(height: 15),
                const Hero(
                  tag: 'SubHeading',
                  child: Text(
                    "Happy to see you again! Please enter your email and password to login to your account.",
                    style: kWelcomeMessage,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: kTextField,
                    decoration: textFieldDecor(
                      "Email Address",
                      const Icon(FontAwesomeIcons.envelope),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    style: kTextField,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: showText,
                    keyboardType: TextInputType.text,
                    decoration: textFieldDecor(
                      "Your Password",
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showText = !showText;
                          });
                        },
                        child: showText
                            ? const Icon(FontAwesomeIcons.eyeSlash)
                            : const Icon(FontAwesomeIcons.eye),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0, top: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password action here
                        Fluttertoast.showToast(
                          msg: "Forgot password tapped",
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: kDeepOrangeAccent,
                          fontSize: 16, // You can change the color
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Hero(
                  tag: 'login',
                  child: RoundedRectButton(
                    textInput: 'Login',
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, BottomNavigation.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    },
                    colour: kDeepOrangeAccent,
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GoogleButton(
                  onPressed: () {},
                ),

                const SizedBox(height: 160),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 72, 71, 71),
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ), // Consistent spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
