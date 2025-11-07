import 'package:flutter/material.dart';

/// Brand color
const Color primaryColor = Color(0xFFFEA400); // Your main brand color
const Color primaryColorLight =
    Color(0xFFFFF3E0); // Light version for backgrounds

/// Complementary colors
const Color secondaryColor =
    Color(0xFFFFC851); // Slightly lighter yellow-orange
const Color accentColor =
    Color(0xFFB06E00); // Darker shade for buttons, overlays

/// Grey shades
const Color darkGreyColor = Color(0xFF121212);
const Color mediumGrey = Color(0xFF232323);
const Color lightGrey = Color.fromARGB(255, 68, 65, 65);
const Color veryLightGrey = Color(0xFFD9D9D9);

/// Neutral colors
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Colors.grey;

/// Special colors
const Color dangerColor = Color(0xFFE83E38);
const Color greenColor = Color(0xFF3EC041); // Keep as accent if needed
const Color amberColor = Color(0xFFFFC107);

/// Background gradient
LinearGradient bgdGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFFFFF3E0), primaryColor],
);

/// Button gradient
LinearGradient buttonGradient = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [accentColor, primaryColor],
);
