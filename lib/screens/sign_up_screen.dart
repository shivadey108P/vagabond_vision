import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/components/buttons_custom.dart';
import '/utilities/constants.dart';
import 'bottom_navigation_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late String fullName;
  late String password;
  late String email;
  late String reEnterPassword;

  String? nameError;
  String? reEnterPasswordError;
  String? emailError;
  String? passwordError;

  bool showText1 = false;
  bool showText2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          // Allows for vertical scrolling
          child: Padding(
            // Ensure consistent spacing
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                const Hero(
                  tag: 'Heading',
                  child: Text(
                    "Sign up",
                    style: kOnBoardingHeading,
                  ),
                ),
                const SizedBox(height: 15),
                const Hero(
                  tag: 'SubHeading',
                  child: Text(
                    "Welcome! Please enter your name, email, and password to create your account.",
                    style: kWelcomeMessage,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    style: kTextField,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: textFieldDecor(
                      "Full Name",
                      const Icon(FontAwesomeIcons.user),
                    ),
                  ),
                ),
                const SizedBox(
                    height: 30), // Ensures spacing between text fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    style: kTextField,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
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
                    onChanged: (value) {
                      password = value;
                    },
                    style: kTextField,
                    obscureText: showText1,
                    keyboardType: TextInputType.text,
                    decoration: textFieldDecor(
                      "Your Password",
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showText1 = !showText1;
                          });
                        },
                        child: showText1
                            ? const Icon(FontAwesomeIcons.eyeSlash)
                            : const Icon(FontAwesomeIcons.eye),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    onChanged: (value) {
                      reEnterPassword = value;
                    },
                    style: kTextField,
                    obscureText: showText2,
                    keyboardType: TextInputType.text,
                    decoration: textFieldDecor(
                      "Re-enter Password",
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showText2 = !showText2;
                          });
                        },
                        child: showText2
                            ? const Icon(FontAwesomeIcons.eyeSlash)
                            : const Icon(FontAwesomeIcons.eye),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Hero(
                  tag: 'Signup',
                  child: RoundedRectButton(
                    textInput: 'Sign up',
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, BottomNavigation.id);
                        }
                        _firestore.collection('UserData').add({
                          'FullName': fullName,
                          'email': email,
                          'password': reEnterPassword,
                        });
                        setState(() {
                          showSpinner = false;
                        });
                      } on FirebaseAuthException catch (error) {
                        if (error.code == 'email-already-in-use') {
                          Fluttertoast.showToast(msg: 'User already exists');
                        } else if (error.code == 'network-request-failed') {
                          Fluttertoast.showToast(msg: 'Network error');
                        } else {
                          Fluttertoast.showToast(msg: error.toString());
                        }
                      }
                    },
                    colour: kDeepOrangeAccent,
                  ),
                ),
                const SizedBox(height: 175),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 72, 71, 71),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Ensures spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
