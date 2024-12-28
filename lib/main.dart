import 'package:flutter/material.dart';
import 'package:login_page/splash.dart';

const SAVE_KEY_VALUE = 'UserLoggedIn';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.lightBlue),
      title: 'Login Page',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
