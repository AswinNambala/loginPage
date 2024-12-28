import 'package:flutter/material.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/zoroXluffy.jpg',
          height: 400,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Future<void> 
checkUserLoggedIn(BuildContext context) async {
  final sharedPref = await SharedPreferences.getInstance();
  final userLoggedIn = sharedPref.getBool(SAVE_KEY_VALUE) ?? false;
  if (!userLoggedIn) {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const LoginPage()),
    );
  } else {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx1) => HomePage()),
    );
  }
}
