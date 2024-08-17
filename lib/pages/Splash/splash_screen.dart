import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/pages/Login/login_screen.dart';
import 'package:quizapp/pages/home/home_screen.dart';
import 'package:quizapp/services/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return LoginScreen();
        }
        if (snapshot.hasData) {
          return HomeScreen();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
