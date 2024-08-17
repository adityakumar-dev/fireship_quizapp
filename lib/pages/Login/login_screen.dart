import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Google Sign In"),
            LoginButton(
              loginMethod: () {
                AuthService().googleSignIn(context);
              },
              icon: FontAwesomeIcons.google,
              text: "Google",
            ),
            const Text("anoymous login : "),
            LoginButton(
              icon: FontAwesomeIcons.user,
              loginMethod: () async {
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                await AuthService().anonSignIn();
                Navigator.pop(context);

                Navigator.pushReplacementNamed(context, '/home');
              },
              color: Colors.white,
              text: "Guest",
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final color;
  final text;
  final icon;
  final Function() loginMethod;
  const LoginButton(
      {super.key, this.color, this.text, this.icon, required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
            onPressed: loginMethod,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(icon)
              ],
            )));
  }
}
