import 'package:fire_base_app/screens/auth/loginpage.dart';
import 'package:fire_base_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'core/providers/services_provider.dart';
import './firebase_options.dart';

import 'screens/auth/authchecker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ServicesProvider>(
          create: (context) => ServicesProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesProvider>(
      builder: (context, servicesProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: servicesProvider.user == null
              ? const LoginPage()
              : const HomePage(),
        );
      },
    );
  }
}
