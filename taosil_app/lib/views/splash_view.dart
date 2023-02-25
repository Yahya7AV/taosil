import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:taosil_app/constants/images_string.dart';
import 'package:taosil_app/utilities/colors/global_color.dart';
import 'package:taosil_app/views/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage(tSplashIcon),
      ),
      backgroundColor: GlobalColor.mainColor,
      splashTransition: SplashTransition.slideTransition,
      nextScreen: const WelcomeView(),
      duration: 2000,
    );
  }
}
