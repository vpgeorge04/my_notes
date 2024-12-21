import 'package:flutter/material.dart';
import 'package:my_notes/auth.dart';
import 'package:my_notes/pages/login.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () async {
                  // Get email, password, and confirm password
                  String email = emailController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;

                  // Check if passwords match
                  if (password == confirmPassword) {
                    try {
                      // Call the register function from auth.dart
                      register(email, password);
                      // Handle successful registration (navigate to login page)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()),
                      );
                    } catch (e) {
                      // Handle registration error (show an error message)
                      print('Registration failed: $e');
                    }
                  } else {
                    // Show an error message if passwords do not match
                    print('Passwords do not match');
                  }
                },
                child: const Text('Register'),
              ),
              OutlinedButton(
                onPressed: () {
                  // Navigate back to login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
