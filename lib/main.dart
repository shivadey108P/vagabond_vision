import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/bottom_navigation_screen.dart';
import 'screens/favourite_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/places_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VagabondVision());
}

class VagabondVision extends StatelessWidget {
  const VagabondVision({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xfffaf9f9),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PlaceScreen.id,
      routes: {
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        BottomNavigation.id: (context) => BottomNavigation(),
        PlaceScreen.id: (context) => PlaceScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        UserScreen.id: (context) => UserScreen(),
        FavouriteScreen.id: (context) => FavouriteScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
      },
    );
  }
}
