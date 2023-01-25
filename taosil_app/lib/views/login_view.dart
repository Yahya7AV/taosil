import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Header text
            const Text("Please login with your Phone Number..."),
            //Enter the phone number
            const TextField(
              keyboardType: TextInputType.phone,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: "e.g. 07711111111",
              ),
              //Enter the password
            ),
            const TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            //press the login button
            TextButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
            // press the forgot the password button
            TextButton(
              onPressed: () {},
              child: const Text("Forgot Password?"),
            ),
            // register a new profile
            TextButton(
              onPressed: () {},
              child: const Text("Register a new Profile"),
            )
          ],
        ),
      ),
    );
  }
}
