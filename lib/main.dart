import 'package:demo_app/firebase_options.dart';
import 'package:demo_app/repo/auth_page.dart';
import 'package:demo_app/repo/hive_repo.dart';
import 'package:demo_app/screens/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HiveRepo().registerHiveAdapter();
  runApp(ProviderScope(child: Demo_app()));
}

class Demo_app extends StatelessWidget {
  const Demo_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
