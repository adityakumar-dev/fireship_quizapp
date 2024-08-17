import 'package:flutter/material.dart';
import 'package:quizapp/services/auth.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("About Screen"),
            ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.pushReplacementNamed(context, '/signin');
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
