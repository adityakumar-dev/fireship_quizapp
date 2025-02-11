import 'package:flutter/material.dart';
import 'package:quizapp/shared/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            child: Text("about")),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
