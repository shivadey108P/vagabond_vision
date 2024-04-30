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
  String email = '';
  String password = '';
  bool showText = false;

  // Variables to hold error messages
  String? emailError;
  String? passwordError;

  // Function to validate the email and password
  bool validateInputs() {
    bool isValid = true;

    setState(() {
      if (email.isEmpty || !RegExp(r'^\S+@\S+\.\S+$').hasMatch(email)) {
        emailError = 'Please enter a valid email address.';
        isValid = false;
      }

      if (password.isEmpty) {
        passwordError = 'Please enter your password.';
        isValid = false;
      } else if (password.length < 6) {
        passwordError = 'Password must be at least 6 characters long.';
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
                const SizedBox(height: 70),
                const Text(
                  "Welcome Back! 😍",
                  style: kOnBoardingHeading,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Please enter your email and password to login.",
                  style: kWelcomeMessage,
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
                    style: kTextField,
                    obscureText: showText,
                    onChanged: (value) {
                      password = value;
                    },
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
                      errorText: passwordError,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0, top: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Forgot Password?",
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: kDeepOrangeAccent,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                RoundedRectButton(
                  textInput: 'Login',
                  onPressed: () {
                    setState(() {
                      showSpinner = true;
                    });

                    if (validateInputs()) {
                      try {
                        setState(() {
                          showSpinner = true;
                        });

                        _auth
                            .signInWithEmailAndPassword(
                                email: email, password: password)
                            .then((user) {
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
                      setState(() {
                        showSpinner = false;
                      });
                      Fluttertoast.showToast(
                        msg: 'Please correct the errors before login.',
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  colour: kDeepOrangeAccent,
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
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Google Login Not Implemented");
                  },
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
                        Navigator.pushNamed(context, SignupScreen.id);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
