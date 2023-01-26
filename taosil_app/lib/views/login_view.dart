import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taosil_app/services/auth/auth_exceptions.dart';
import 'package:taosil_app/services/auth/bloc/auth_bloc.dart';
import 'package:taosil_app/services/auth/bloc/auth_event.dart';
import 'package:taosil_app/services/auth/bloc/auth_state.dart';
import 'package:taosil_app/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(
                context, "Credentials you entered are Incorrect");
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(context, "Email or Password are Incorrect");
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, "Authentication Error");
          }
        }
      },
      child: Scaffold(
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
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
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
                onPressed: () async {
                  context.read<AuthBloc>().add(const AuthEventShouldRegister());
                },
                child: const Text("Don't have an account? Register Now!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
