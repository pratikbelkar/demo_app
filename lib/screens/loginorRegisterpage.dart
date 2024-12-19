import 'package:demo_app/screens/login_Screen.dart';
import 'package:demo_app/screens/register_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Loginorregisterpage extends StatefulWidget {
  const Loginorregisterpage({super.key});

  @override
  State<Loginorregisterpage> createState() => _LoginorregisterpageState();
}

class _LoginorregisterpageState extends State<Loginorregisterpage> {
  bool showLoginPage = true;

  // ignore: non_constant_identifier_names
  void TogglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: TogglePages);
    } else {
      return RegisterPage(
        onTap: TogglePages,
      );
    }
  }
}
