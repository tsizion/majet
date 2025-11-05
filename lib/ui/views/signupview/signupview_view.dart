import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Register",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Full Name
              TextFormField(
                controller: viewModel.fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter your full name'
                    : null,
              ),
              const SizedBox(height: 20),

              // Email
              TextFormField(
                controller: viewModel.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || !value.contains('@')
                    ? 'Enter a valid email'
                    : null,
              ),
              const SizedBox(height: 20),

              // Password
              TextFormField(
                controller: viewModel.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.length < 6
                    ? 'Password must be 6+ chars'
                    : null,
              ),
              const SizedBox(height: 20),

              // Role selection
              DropdownButtonFormField<String>(
                value: viewModel.role,
                items: const [
                  DropdownMenuItem(value: 'consumer', child: Text('Consumer')),
                  DropdownMenuItem(value: 'uploader', child: Text('Uploader')),
                ],
                onChanged: (value) => viewModel.role = value ?? 'consumer',
                decoration: const InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),

              // Submit button with loading
              ElevatedButton(
                onPressed: viewModel.isLoading
                    ? null
                    : () async {
                        final success = await viewModel.registerUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              success
                                  ? 'Registration successful!'
                                  : 'Registration failed!',
                            ),
                          ),
                        );
                      },
                child: viewModel.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignupviewViewModel viewModelBuilder(BuildContext context) =>
      SignupviewViewModel();
}
