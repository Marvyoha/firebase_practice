import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/auth_provider.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';
import '../widgets/spacing.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

TextEditingController fullNameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController locationController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context, listen: false);

    void signUpLogic() {
      if (passwordController.text == confirmPasswordController.text) {
        // Create User
        authprovider.signUp(emailController.text, passwordController.text);
        // Add user details in the database  (cloud firestore)
        authprovider.storeUserDetails(
            int.parse(ageController.text),
            emailController.text,
            fullNameController.text,
            locationController.text);

        authprovider.signOut();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.white,
            content: Center(
              child: Text(
                'password does not match',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      }
    }

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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Hello there register your details below',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const Space(),
                CustomTextField(
                  controller: fullNameController,
                  hint: 'Full Name:',
                ),
                const Space(),
                CustomTextField(
                  controller: ageController,
                  hint: 'Age:',
                ),
                const Space(),
                CustomTextField(
                  controller: locationController,
                  hint: 'Location:',
                ),
                const Space(),
                CustomTextField(
                  controller: emailController,
                  hint: 'E-mail:',
                ),
                const Space(),
                CustomTextField(
                  controller: passwordController,
                  obscureText: true,
                  hint: 'Password:',
                ),
                const Space(),
                CustomTextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  hint: ' Confirm Password:',
                ),
                const Space(),
                CustomButton(
                  onTap: () {
                    signUpLogic();
                  },
                  title: 'Sign-up',
                ),
                const Space(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Have an account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Sign-in',
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
