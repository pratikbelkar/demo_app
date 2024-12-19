import 'package:demo_app/screens/bottom_navbar.dart';
import 'package:demo_app/screens/home_screen.dart';
import 'package:demo_app/screens/login_Screen.dart';
import 'package:demo_app/screens/loginorRegisterpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Example();
            } else {
              return Loginorregisterpage();
            }
          }),
    );
  }
}
