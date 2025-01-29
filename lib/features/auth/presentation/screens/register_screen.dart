import 'package:flutter/material.dart';
import 'package:home_haven_clean/features/auth/presentation/controller/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone",
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "password",
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await authProvider.register(
                  phoneNumber: phoneController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(authProvider.message),
                  ),
                );
              },
              child: authProvider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                      "Register",
                    ),
            ),
          ],
        );
      },
    ));
  }
}
