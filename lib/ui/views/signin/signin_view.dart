import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'signin_viewmodel.dart';
import 'package:majet/components/customInputDecoration.dart';
import 'package:majet/components/PrimaryButton.dart';

class SigninView extends StackedView<SigninViewModel> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // center vertically
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/logo2.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Login ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Email Field
                  TextFormField(
                    controller: viewModel.emailController,
                    decoration: customInputDecoration(label: 'Email'),
                    validator: (value) => value == null || !value.contains('@')
                        ? 'Enter a valid email'
                        : null,
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: true,
                    decoration: customInputDecoration(label: 'Password'),
                    validator: (value) => value == null || value.length < 6
                        ? 'Password must be 6+ chars'
                        : null,
                  ),
                  const SizedBox(height: 30),

                  // Sign In Button
                  PrimaryButton(
                    label: viewModel.isBusy ? 'Signing In...' : 'Sign In',
                    onPressed: viewModel.isBusy ? null : viewModel.signIn,
                    height: 50,
                  ),
                  const SizedBox(height: 10),

                  // Navigate to Signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account? "),
                      GestureDetector(
                        onTap: viewModel.goToSignup,
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  SigninViewModel viewModelBuilder(BuildContext context) => SigninViewModel();
}
