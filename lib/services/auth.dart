import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final Stream<User?> authStream = FirebaseAuth.instance.authStateChanges();
  final User? user = FirebaseAuth.instance.currentUser;
  //annonymous login
  Future<void> anonSignIn() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  //google sign in
  Future<void> googleSignIn(context) async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
