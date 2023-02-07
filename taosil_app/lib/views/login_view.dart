import 'package:flutter/material.dart';
import 'package:taosil_app/constants/routes.dart';
import 'package:taosil_app/services/auth/auth_exceptions.dart';
import 'package:taosil_app/services/auth/auth_service.dart';
import 'package:taosil_app/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _isHidden = true;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //Header text
            const Text("Please login with your Email Address"),
            //Enter the email
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              //Enter the password
            ),
            TextField(
              controller: _password,
              obscureText: _isHidden,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: "Password",
                suffix: InkWell(
                  onTap: _togglePasswordView,
                  child:
                      Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
            //press the login button
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthService.firebase()
                      .logIn(email: email, password: password);
                  final user = AuthService.firebase().currentUser;
                  if (user?.isEmailVerified ?? false) {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      forgotPasswordRoute,
                      (route) => false,
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      verifyEmailRoute,
                      (route) => false,
                    );
                  }
                } on UserNotFoundAuthException {
                  await showErrorDialog(context, "User Not Found!");
                } on WrongPasswordAuthException {
                  await showErrorDialog(
                      context, "Email/Password is Incorrect!");
                } on GenericAuthException {
                  await showErrorDialog(context, "Authentication Error!");
                }
              },
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 18),
              ),
            ),
            // press the forgot the password button
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(forgotPasswordRoute);
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 16),
                )),
            // register a new profile
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
