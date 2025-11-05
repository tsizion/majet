import 'package:flutter/material.dart';

/// Color constants

const Color primaryColor = Color(0xFF68BF6F);
const Color primaryColorLight = Color(0xFFE8FFEB);

const Color secondaryColor = Color(0XFF3EC041);

const Color redColor = Color(0xFFE83E38);

const Color darkGreyColor = Color(
  0xFF121212,
); // Very dark grey (general background)
const Color mediumGrey = Color(0xFF232323); // Medium grey for cards
const Color lightGrey = Color(0xFF707070); // Light grey for text
const Color veryLightGrey = Color(0xFFD9D9D9); // For borders or inactive states

// Neutral colors
const Color whiteColor = Colors.white;
const Color greyColor = Colors.grey;

const Color blackColor = Colors.black;

// Special colors
const Color dangerColor = Colors.red;
const Color greenColor = Colors.green;
const Color amberColor = Colors.amber;

// Background gradient
// LinearGradient bgdGradiant = const LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [darkPurple, darkGreyColor],
// );

LinearGradient bgdGradiant = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.center,
  tileMode: TileMode.decal,
  colors: [Color.fromARGB(255, 69, 104, 61), Colors.green],
  transform: GradientRotation(0),
);

const Color gradientStartColor = Color(0xFF317A37);
const Color gradientEndColor = Color(0xFF3EC041);

// Button gradient
LinearGradient buttonGradiant = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [gradientStartColor, gradientEndColor],
  transform: GradientRotation(0),
);

// const LinearGradient(
// colors: [gradientStartColor, gradientEndColor],
// ),
