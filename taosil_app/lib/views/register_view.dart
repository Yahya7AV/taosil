import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taosil_app/services/auth/bloc/auth_bloc.dart';
import 'package:taosil_app/services/auth/bloc/auth_event.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register a new Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Enter your phone number and password to register a new profile"),
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
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      context
                          .read<AuthBloc>()
                          .add(AuthEventRegister(email, password));
                    },
                    child: const Text("Register"),
                  ),
                  TextButton(
                      onPressed: () async {
                        context.read<AuthBloc>().add(const AuthEventLogOut());
                      },
                      child: const Text("Already have an account? Login here!"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
