import 'package:fire_base_app/core/providers/auth_provider.dart';
import 'package:fire_base_app/screens/auth/loginpage.dart';
import 'package:fire_base_app/screens/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Signed in as ${auth.user?.email}'),
          ),
          const Space(),
          MaterialButton(
            color: Colors.deepPurple[200],
            child: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}