import 'package:flutter/material.dart';
import 'package:taosil_app/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: "Log Out",
    content: "Are you sure you want to log out?",
    optionsBuilder: () => {
      "Cancel": false,
      "Log Out": true,
    },
  ).then((value) => value ?? false);
}
