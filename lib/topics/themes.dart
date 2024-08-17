import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
    // useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.nunito().fontFamily,
    textTheme: TextTheme(
        titleSmall: TextStyle(color: Colors.grey),
        headlineLarge: TextStyle(fontWeight: FontWeight.bold)),
    buttonTheme: ButtonThemeData());
