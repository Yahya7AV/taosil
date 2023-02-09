import 'package:flutter/material.dart';
import 'package:taosil_app/constants/routes.dart';
import 'package:taosil_app/services/auth/auth_service.dart';
import 'package:taosil_app/views/forgot_password_view.dart';
import 'package:taosil_app/views/login_view.dart';
import 'package:taosil_app/views/register/client_register_view.dart';
import 'package:taosil_app/views/register/driver_register_view.dart';
import 'package:taosil_app/views/register_view.dart';
import 'package:taosil_app/views/splash_view.dart';
import 'package:taosil_app/views/verify_email_view.dart';
import 'package:taosil_app/views/welcome_view.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Taosil",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        forgotPasswordRoute: (context) => const ForgotPasswordView(),
        welcomeRoute: (context) => const WelcomeView(),
        driverRegisterRoute: (context) => const DriverRegisterView(),
        clientRegisterRoute: (context) => const ClientRegisterView(),
        splashRoute: (context) => const SplashView()
      }));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const SplashView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
