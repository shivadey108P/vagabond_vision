import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
  String? password;
  String? reEnterPassword;
  final List<String> genderOptions = ['Male', 'Female'];
  String? selectedGender;

  bool showText1 = false;
  bool showText2 = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    child: TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: '* Required'),
                        PatternValidator(r'^[a-zA-Z\s]+$',
                            errorText:
                                'Full name must contain only letters and spaces. ')
                      ]).call,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        fullName = value;
                      },
                      decoration: textFieldDecor(
                        "Full Name",
                        const Icon(
                          FontAwesomeIcons.user,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ]).call,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: textFieldDecor(
                        "Email Address",
                        const Icon(
                          FontAwesomeIcons.envelope,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: '* Required'),
                        MinLengthValidator(6,
                            errorText:
                                'Your password must contain atleast 6 characters.')
                      ]).call,
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return '* Required';
                        } else if (val != password) {
                          return 'Passwords do not match.';
                        }
                        return null;
                      },
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: DropdownButtonFormField<String>(
                      // dropdownColor: Colors.black,
                      hint: const Text('Gender'),
                      // dropdownColor: Colors.white,
                      style: kTextFormFieldStyle,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        labelStyle: kNormal,
                        hintStyle: kNormal,
                      ),
                      items: genderOptions.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedGender = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select your gender";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  RoundedRectButton(
                    textInput: 'Sign up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          showSpinner = true;
                        });

                        _auth
                            .createUserWithEmailAndPassword(
                                email: email, password: password!)
                            .then((user) {
                          _firestore
                              .collection('UserData')
                              .doc(user.user?.uid)
                              .set({
                            'FullName': fullName,
                            'email': email,
                            'gender': selectedGender,
                          });
                          Navigator.pushNamed(context, BottomNavigation.id);
                        }).catchError((e) {
                          if (e is FirebaseAuthException) {
                            Fluttertoast.showToast(msg: "Error: ${e.code}");
                          }
                        }).whenComplete(() {
                          setState(() {
                            showSpinner = false;
                          });
                        });
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Please correct the errors before proceeding.',
                        );
                      }
                    },
                    colour: kDeepOrangeAccent,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: const Text(
                          "Login",
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
      ),
    );
  }
}
