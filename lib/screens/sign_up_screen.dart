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
  late String email;
  late String password;
  late String reEnterPassword;

  // Error messages for validation feedback
  String? fullNameError;
  String? emailError;
  String? passwordError;
  String? reEnterPasswordError;

  bool showText1 = false;
  bool showText2 = false;

  // Function to validate all inputs
  bool validateInputs() {
    bool isValid = true;

    setState(() {
      // Validate full name (letters and spaces only)
      if (fullName.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(fullName)) {
        fullNameError = 'Full name must contain only letters and spaces.';
        isValid = false;
      }

      // Validate email
      if (email.isEmpty || !RegExp(r'^\S+@\S+\.\S+$').hasMatch(email)) {
        emailError = 'Please enter a valid email address.';
        isValid = false;
      }
      // Validate password length
      if (password.length < 6) {
        passwordError = 'Password must be at least 6 characters long.';
        isValid = false;
      }
      // Validate re-entered password
      if (reEnterPassword != password) {
        reEnterPasswordError = 'Passwords do not match.';
        isValid = false;
      }
    });

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    "Sign up",
                    style: kOnBoardingHeading,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome! Please enter your Name, email, and password to create your account.",
                  style: kWelcomeMessage,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: textFieldDecor(
                      "Full Name",
                      Icon(
                        FontAwesomeIcons.user,
                        color:
                            fullNameError == null ? Colors.black : Colors.red,
                      ),
                      errorText: fullNameError,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: textFieldDecor(
                      "Email Address",
                      Icon(
                        FontAwesomeIcons.envelope,
                        color: emailError == null ? Colors.black : Colors.red,
                      ),
                      errorText: emailError,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: showText1,
                    onChanged: (value) {
                      password = value;
                    },
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
                        errorText: passwordError),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: showText2,
                    onChanged: (value) {
                      reEnterPassword = value;
                    },
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
                      errorText: reEnterPasswordError,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                RoundedRectButton(
                  textInput: 'Sign up',
                  onPressed: () {
                    if (validateInputs()) {
                      try {
                        setState(() {
                          showSpinner = true;
                        });

                        _auth
                            .createUserWithEmailAndPassword(
                                email: email, password: password)
                            .then((user) {
                          _firestore
                              .collection('UserData')
                              .doc(user.user?.uid)
                              .set({
                            'FullName': fullName,
                            'email': email,
                            'createdAt': FieldValue.serverTimestamp(),
                          });
                          Navigator.pushNamed(context, BottomNavigation.id);
                        }).catchError((e) {
                          if (e is FirebaseAuthException) {
                            Fluttertoast.showToast(
                              msg: "Error: ${e.code}",
                              backgroundColor: Colors.red,
                            );
                          }
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

                        setState(() {
                          showSpinner = false;
                        });
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please correct the errors before proceeding.',
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  colour: kDeepOrangeAccent,
                ),
                const SizedBox(height: 175),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
