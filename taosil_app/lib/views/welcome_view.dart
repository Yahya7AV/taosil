import 'package:flutter/material.dart';
import 'package:taosil_app/constants/routes.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double
              .infinity, //the parent will control the size (double.infinity)
          height: MediaQuery.of(context)
              .size
              .height, //according to the screen(mediaquery)
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Book a taxi to your Destination",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 15,
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    loginRoute,
                    (route) => false,
                  );
                },
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    registerRoute,
                    (route) => false,
                  );
                },
                color: Colors.red[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
