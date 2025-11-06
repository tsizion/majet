import 'package:flutter/material.dart';
import 'package:majet/core/constants/app_colors.dart'; // Your color constants

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed; // <-- nullable now
  final double? width; // Optional width, uses default if not provided
  final double height;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50, // default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // Use passed width or full width
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Brand color
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Increased rounding
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
