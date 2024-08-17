import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.graduationCap,
              size: 20,
            ),
            label: "Topics"),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bolt,
              size: 20,
            ),
            label: "about"),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.circleUser,
              size: 20,
            ),
            label: "profile")
      ],
      fixedColor: Colors.deepPurple[400],
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
          case 2:
            Navigator.pushNamed(context, '/about');
            break;
        }
      },
    );
  }
}
