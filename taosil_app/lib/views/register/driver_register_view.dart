import 'package:flutter/material.dart';
import 'package:taosil_app/constants/routes.dart';
import 'package:taosil_app/utilities/colors/global_color.dart';

class DriverRegisterView extends StatefulWidget {
  const DriverRegisterView({super.key});

  @override
  State<DriverRegisterView> createState() => _DriverRegisterViewState();
}

class _DriverRegisterViewState extends State<DriverRegisterView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Register",
            style: TextStyle(
              color: GlobalColor.mainColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        clientRegisterRoute, (route) => false);
                  },
                  child: Text("Client",
                      style: TextStyle(
                        color: GlobalColor.mainColor,
                      ))),
              TextButton(onPressed: () {}, child: Text("Driver", style: TextStyle(),)),
            ],
          ),
        ],
      ),
    );
  }
}
