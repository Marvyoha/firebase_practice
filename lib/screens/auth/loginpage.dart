import 'package:fire_base_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/services_provider.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';
import '../widgets/spacing.dart';
import 'forgotpasswordpage.dart';
import 'signuppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create controllers for email and password text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the ServicesProvider from the context
    final servicesProvider =
        Provider.of<ServicesProvider>(context, listen: false);

    // Build the login page
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.android_rounded,
                  size: 100,
                ),
                const Space(),
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                const Space(),
                const Space(),
                CustomTextField(
                  controller: emailController,
                  hint: 'E-Mail:',
                ),
                const Space(),
                CustomTextField(
                  controller: passwordController,
                  obscureText: true,
                  hint: 'Password:',
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                  child: const Align(
                      alignment: Alignment(0.8, 0),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )),
                ),
                const Space(),
                CustomButton(
                  onTap: () {
                    // Call signIn function from ServicesProvider
                    servicesProvider.signIn(
                        emailController.text, passwordController.text);
                    // To check if the user is valid
                    servicesProvider.auth?.authStateChanges().listen((user) {
                      if (user != null) {
                        // Navigate to home
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      }
                    });
                  },
                  title: 'Sign-in',
                ),
                const Space(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Not a Member?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Register Now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const Space(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
