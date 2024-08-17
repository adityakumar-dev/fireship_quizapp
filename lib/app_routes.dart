import 'package:quizapp/pages/about/about_screen.dart';
import 'package:quizapp/pages/home/home_screen.dart';

import 'pages/Login/login_screen.dart';
import 'pages/SignUp/signup_screen.dart';
import 'pages/Splash/splash_screen.dart';

var appRoutes = {
  '/': (context) => const SplashScreen(),
  '/signin': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
  '/home': (context) => const HomeScreen(),
  '/about': (context) => const AboutScreen()
};
