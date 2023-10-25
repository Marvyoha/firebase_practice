import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/services_provider.dart';
import '../widgets/Spacing.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    ServicesProvider servicesProvider = Provider.of<ServicesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Enter Your Email we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          const Space(),
          CustomTextField(
            controller: emailController,
            hint: 'E-Mail:',
          ),
          const Space(),
          CustomButton(
            title: 'Reset Password',
            onTap: () {
              setState(() {
                servicesProvider.resetPassword(emailController.text, context);
              });
            },
          ),
        ],
      ),
    );
  }
}
