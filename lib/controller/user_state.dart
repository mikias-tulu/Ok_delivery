import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';
import 'package:ok_delivery/screens/login_signup_screen.dart';
import 'package:ok_delivery/screens/map_screen.dart';

class UserState extends StatelessWidget {
  const UserState({Key? key}) : super(key: key);

  static const String route = '/onboarding';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return user != null ? const HomeScreen() : const LoginSignupScreen();
  }
}
