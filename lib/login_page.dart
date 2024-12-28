import 'package:flutter/material.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Centers the login form
        child: Container(
          padding: const EdgeInsets.all(50),
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amber[100],
            shape: BoxShape.rectangle,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ensures the Column takes up minimum vertical space
              children: [
                Text(
                  'LOGIN PAGE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Colors.orange[700]),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    label: Text('Username'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invaild value';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.key_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invaild value';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      checkLoginPage(context);
                    } else {}
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLoginPage(BuildContext ctx) async {
    List<Map<String, String>> checkUserId = [
      {'username': 'aswin', 'password': '12345'},
      {'username' : 'achu' , 'password' : '12345'}
    ];
    final username = _userController.text;
    final password = _passwordController.text;

    bool isValidUser = checkUserId.any(
    (user) => user['username'] == username && user['password'] == password,
  );

    if (isValidUser) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_VALUE, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
