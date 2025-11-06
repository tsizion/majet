import 'package:flutter/material.dart';
import 'package:majet/components/PrimaryButton.dart';
import 'package:stacked/stacked.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image
          SizedBox.expand(
            child: Image.asset(
              'assets/food.png',
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent yellow overlay (brand theme)
          Container(
            color: const Color.fromARGB(255, 14, 9, 2).withOpacity(0.5),
          ),
          // Centered content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo image
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 30),
                  // Continue as Guest button
                  PrimaryButton(
                    label: "Continue as Guest",
                    onPressed: viewModel.continueAsGuest,
                  ),
                  const SizedBox(height: 15),
                  // Sign Up button
                  PrimaryButton(
                    label: "Sign Up",
                    onPressed: viewModel.signUp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
}
