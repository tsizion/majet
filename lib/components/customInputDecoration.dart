import 'package:flutter/material.dart';
import 'package:majet/core/constants/app_colors.dart';
import 'package:majet/core/constants/app_text_style.dart';

InputDecoration customInputDecoration({
  required String label,
  String? hintText,
  Widget? suffixIcon,
  String? errorText, // optional error text
}) {
  return InputDecoration(
    labelText: label,
    hintText: hintText,
    errorText: errorText,
    labelStyle: AppTextStyle.h4Normal.copyWith(
      color: primaryColor, // Brand color for label
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20), // Rounded like buttons
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 0.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: primaryColor, // Brand color for focused border
        width: 1.0,
      ),
    ),
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    fillColor: Colors.white, // Optional: white background
    filled: true,
  );
}
