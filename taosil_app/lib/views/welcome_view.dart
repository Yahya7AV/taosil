import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:taosil_app/constants/routes.dart';
import 'package:taosil_app/utilities/colors/global_color.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 130,
              child: Center(
                child: AnimatedTextKit(
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    RotateAnimatedText(
                      "Welcome",
                      textStyle: TextStyle(
                        fontSize: 50,
                        color: GlobalColor.mainColor,
                      ),
                    ),
                    RotateAnimatedText(
                      "To",
                      textStyle: TextStyle(
                        fontSize: 50,
                        color: GlobalColor.mainColor,
                      ),
                    ),
                    RotateAnimatedText(
                      "Taosil",
                      rotateOut: false,
                      textStyle: TextStyle(
                        fontSize: 50,
                        color: GlobalColor.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              repeatForever: false,
              totalRepeatCount: 2,
              animatedTexts: [
                TyperAnimatedText(
                  "Book a Taxi to YOUR destination...",
                  textStyle: const TextStyle(fontSize: 20),
                  speed: const Duration(microseconds: 100),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, loginRoute, (route) => false);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      side: BorderSide(color: GlobalColor.mainColor),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("Login".toUpperCase()),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, registerRoute, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(),
                      side: BorderSide(color: GlobalColor.mainColor),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("Register".toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
