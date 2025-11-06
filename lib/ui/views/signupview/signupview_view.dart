import 'package:flutter/material.dart';
import 'package:majet/components/PrimaryButton.dart';
import 'package:majet/components/customInputDecoration.dart';
import 'package:stacked/stacked.dart';
import 'signupview_viewmodel.dart';

class SignupView extends StackedView<SignupviewViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupviewViewModel viewModel,
    Widget? child,
  ) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: height),
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
                    "Create Account",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Full Name
                  TextFormField(
                    controller: viewModel.fullNameController,
                    decoration: customInputDecoration(label: 'Full Name'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter your full name'
                        : null,
                  ),
                  const SizedBox(height: 20),

                  // Email
                  TextFormField(
                    controller: viewModel.emailController,
                    decoration: customInputDecoration(label: 'Email'),
                    validator: (value) => value == null || !value.contains('@')
                        ? 'Enter a valid email'
                        : null,
                  ),
                  const SizedBox(height: 20),

                  // Password
                  TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: true,
                    decoration: customInputDecoration(label: 'Password'),
                    validator: (value) => value == null || value.length < 6
                        ? 'Password must be 6+ chars'
                        : null,
                  ),
                  const SizedBox(height: 20),

                  // Role Dropdown
                  DropdownButtonFormField<String>(
                    value: viewModel.role,
                    items: const [
                      DropdownMenuItem(
                          value: 'consumer', child: Text('Consumer')),
                      DropdownMenuItem(
                          value: 'uploader', child: Text('Uploader')),
                    ],
                    onChanged: (value) => viewModel.role = value ?? 'consumer',
                    decoration: customInputDecoration(label: 'Role'),
                  ),
                  const SizedBox(height: 30),

                  // Primary Button
                  PrimaryButton(
                    label: viewModel.isBusy ? 'Registering...' : 'Register',
                    onPressed: viewModel.isBusy
                        ? null
                        : () async {
                            final success = await viewModel.registerUser();

                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  success
                                      ? '✅ Registration successful!'
                                      : '❌ Registration failed!',
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          },
                    height: 50,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          viewModel.navigateToSignin();
                        },
                        child: const Text(
                          "Login",
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
  SignupviewViewModel viewModelBuilder(BuildContext context) =>
      SignupviewViewModel();
}
