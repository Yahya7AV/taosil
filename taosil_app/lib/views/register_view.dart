import 'package:flutter/material.dart';
import 'package:taosil_app/constants/routes.dart';
import 'package:taosil_app/services/auth/auth_exceptions.dart';
import 'package:taosil_app/services/auth/auth_service.dart';
import 'package:taosil_app/utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _isHidden = true;

  @override
  void initState() {
    _password = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
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
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, left: 12, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
                "Enter your Email and password to register a new profile"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(clientRegisterRoute);
                  },
                  child: const Text('Client'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(driverRegisterRoute);
                  },
                  child: const Text('Driver'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              autofocus: true,
              decoration: const InputDecoration(hintText: "Email"),
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
                    child: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility),
                  )),
            ),
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        await AuthService.firebase().createUser(
                          email: email,
                          password: password,
                        );
                        AuthService.firebase().sendEmailVerification();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushNamed(verifyEmailRoute);
                      } on WeakPasswordAuthException {
                        await showErrorDialog(context, "Weak Password");
                      } on EmailAlreadyInUseAuthException {
                        await showErrorDialog(
                            context, "The Email is already registered");
                      } on InvalidEmailAuthException {
                        await showErrorDialog(context, "Invalid Email");
                      } on GenericAuthException {
                        await showErrorDialog(context, "Authentication Error");
                      }
                    },
                    child: const Text("Sign Up"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          loginRoute, (route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Log In",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        )
                      ],
                    ),
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
