import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color primaryColor = Color(0xFF4F46E5);
  static const Color secondaryColor = Color(0xFF06B6D4);
  static const Color accentColor = Color(0xFFEC4899);

  static const List<Color> gradientColors = [
    Color(0xFF4F46E5),
    Color(0xFF7C3AED),
    Color(0xFFEC4899),
    Color(0xFF06B6D4),
  ];

  // Text
  static const String heroName = "Hi, I'm Kabirul Islam";
  static const String heroTitle = "Flutter Developer";
  static const String heroDescription =
      "Crafting beautiful, performant cross-platform apps with Flutter. "
      "4+ years of experience delivering production-grade solutions.";

  // Social Links
  static const String linkedInUrl =
      "https://www.linkedin.com/in/kabirul-islam-779010214/";
  static const String whatsAppNumber = "+919330081292";
  static const String emailAddress = "kabirul.islam.co@gmail.com";
}

class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}
